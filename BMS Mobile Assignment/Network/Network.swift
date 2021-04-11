//
//  Network.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import UIKit

protocol NetworkServices {
  @discardableResult func request<T: Decodable>(_ endPoint: MovieServices, objectType: T.Type, completion: @escaping (Result<T, NetworkFailure>) -> Void) -> URLSessionDataTask
  
  func request(_ endPoint: String, completion: @escaping (Result<UIImage?, NetworkFailure>) -> Void)
}

class Network: NetworkServices, URLComponentRequest {
  private var session: URLSession?
  
  static var defaultSession: URLSession = {
      let configuration = URLSessionConfiguration.default
      configuration.timeoutIntervalForRequest = 20
      if #available(iOS 11.0, *) {
          configuration.waitsForConnectivity = true
      }
      return URLSession(configuration: configuration)
  }()

  init(session: URLSession = Network.defaultSession) {
      self.session = session
  }
  
  func request<T>(_ _request: MovieServices, objectType: T.Type, completion: @escaping (Result<T, NetworkFailure>) -> Void) -> URLSessionDataTask where T : Decodable {
    let request = try? makeURLRequest(for: _request)
    
    let dataTask = session?.dataTask(with: request!) { (data, response, error) in
      if let error = error as NSError?, error.domain == NSURLErrorDomain {
        completion(Result.failure(NetworkFailure.invalidRequestURL(error as! URL)))
          return
      }
      
      guard let data = data else {
          completion(Result.failure(NetworkFailure.emptyData))
          return
      }
      
      do {
          let jsonObject = try JSONDecoder().decode(objectType, from: data)
          completion(Result.success(jsonObject))
      } catch {
          completion(Result.failure(NetworkFailure.decodingError(error as! DecodingError)))
      }
    }
    dataTask?.resume()
    return dataTask!
  }
  
  
  func request(_ endPoint: String, completion: @escaping (Result<UIImage?, NetworkFailure>) -> Void) {
    guard let url = URL(string: APIConstants.movieImagesBaseURL + endPoint) else {
      return
    }
    
    let task = session?.dataTask(with: url) { (data, response, error) in
      if let imageData = data, let image = UIImage(data: imageData) {
        completion(Result.success(image))
      } else {
        completion(Result.failure(NetworkFailure.emptyData))
      }
    }
    
    task?.resume()
  }
  

//  task.resume()
}










