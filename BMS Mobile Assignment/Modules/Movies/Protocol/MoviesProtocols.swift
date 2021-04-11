//
//  MoviesProtocols.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation

// MARK: View
protocol MoviesViewInput: AnyObject {
  var presenter: MoviesViewOutput! { get set }
  func insertMovies(with model: MoviesBase)
  func showAlertOnFailure(title: String, msg: String)
}

// MARK: Presenter
protocol MoviesViewOutput: AnyObject {
  func getMovies(for index: Int)
  func didSelect(movie: Movie)
  func showSearchController(for movies: [Movie])
}


protocol MoviesInteractorOutput: AnyObject {
  func getMoviesSuccess(_ moviesBase: MoviesBase)
  func getMoviesError(_ error: NetworkFailure)
}

//MARK: InteractorInput
protocol MoviesInteractorInput: AnyObject {
  var presenter: MoviesInteractorOutput? { get set }
  func loadMovies(for pageNum: Int)
}

//MARK: Router
protocol MoviesRouterInput: AnyObject {
  func showDetails(for movie: Movie)
  func openSearchView(with movies: [Movie])
}
