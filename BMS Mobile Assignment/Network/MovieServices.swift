//
//  MovieServices.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation

enum MovieServices {
  case getMoviesFor(page: Int)
  case getSynopsisForMovie(id: Int)
  case getReviewsForMovie(id: Int)
  case getCreditsForMovie(id: Int)
  case getSimilarMoviesForMovie(id: Int)
}

extension MovieServices {
  var parameters: [String : Any] {
      switch self {
      case let .getMoviesFor(page)://, let .getMovieReviews(_, page), let .getSimilarMovies(_, page):
          return [
              "api_key": APIConstants.movieAPIKey,
              "language": "en-US",
              "page": page
          ]
          
      default:
          return [
              "api_key": APIConstants.movieAPIKey,
              "language": "en-US"
          ]
      }
  }
  
  var baseURL: URL {
    return URL(string: APIConstants.movieBaseURL)!
  }
  
  var path: String {
    switch self {
    case .getMoviesFor:
      return "/3/movie/now_playing"
      
    case let .getSynopsisForMovie(id):
      return "/3/movie/" + id.description
      
    case let .getReviewsForMovie(id):
      return "/3/movie/" + id.description + "/reviews"
      
    case let .getCreditsForMovie(id):
      return "/3/movie/" + id.description + "/credits"
      
    case let .getSimilarMoviesForMovie(id):
      return "/3/movie/" + id.description + "/similar"
    }
  }
  
  var method: HTTPMethod {
    return HTTPMethod.get
  }
  
  var headers: [String: String]? {
      return [
          "Accept": "application/json",
          "Content-Type": "application/json"
      ]
  }
}

//MARK: NetworkAPI Constants
enum APIConstants {
    static let movieBaseURL = "https://api.themoviedb.org"
    static let movieImagesBaseURL = "https://image.tmdb.org/t/p/w300"
    static let movieAPIKey = "1e557e7385791a6a3ae3af2802b214ee"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
