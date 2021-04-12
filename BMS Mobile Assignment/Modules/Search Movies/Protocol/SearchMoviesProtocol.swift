//
//  SearchMoviesProtocol.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

protocol SearchMoviesViewOutput: AnyObject {
  var view: SearchMoviesViewInput? {get set}
  func getRecentAccessedData()
  func showDetails(movie: Movie)
  func search(text: String)
}

protocol SearchMoviesViewInput: AnyObject {
  var presenter: SearchMoviesViewOutput? {get set}
  func recentAccessed(movies: [Movie])
  func searched(movies: [Movie])
}

protocol SearchMoviesInteractorInput: AnyObject {
  var presenter: SearchMoviesInteractorOutput?  {get set}
  func getRecentData()
}

protocol SearchMoviesInteractorOutput: AnyObject {
  var interactor: SearchMoviesInteractorInput?  {get set}
  func updateRecent(movies: [Movie])
}

protocol SearchMoviesRouterInput: AnyObject {
  func showDetails(for movie: Movie)
}
