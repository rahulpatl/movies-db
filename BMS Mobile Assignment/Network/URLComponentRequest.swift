//
//  URLComponentRequest.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation
protocol URLComponentRequest {
  func makeURLRequest(for service: MovieServices)throws -> URLRequest
}

extension URLComponentRequest {
  func makeURLRequest(for service: MovieServices)throws -> URLRequest {
    var components = URLComponents(url: service.baseURL, resolvingAgainstBaseURL: false)
    components?.path = service.path
    components?.queryItems = append(parameters: service.parameters)
    
    guard let url = components?.url else {
      let URL = service.baseURL
      throw NetworkFailure.invalidRequestURL(URL.appendingPathComponent(service.path))
    }
    
    var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
    request.httpMethod = service.method.rawValue
    request.setHeaders(service.headers)
    return request
  }
  
  private func append(parameters: [String: Any]) -> [URLQueryItem] {
    let queryParameters: [URLQueryItem] = parameters.compactMap { (element) -> URLQueryItem? in
      if let value = element.value as? Int {
        return URLQueryItem(name: element.key, value: value.description)
      } else if let value = element.value as? String {
        return URLQueryItem(name: element.key, value: value.description)
      } else {
        return nil
      }
    }
    return queryParameters
  }
}

extension URLRequest {
  mutating func setHeaders(_ headers: [String: String]? = nil) {
    guard let headers = headers else {
      return
    }
    
    headers.forEach {
      setValue($0.key, forHTTPHeaderField: $0.value)
    }
  }
}
