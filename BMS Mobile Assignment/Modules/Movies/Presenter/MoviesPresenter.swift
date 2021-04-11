//
//  MoviesPresenter.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation

class MoviesPresenter: MoviesViewOutput, MoviesInteractorOutput {
  weak var view: MoviesViewInput?
  var interactor: MoviesInteractorInput!
  var router: MoviesRouterInput!
  
  func getMovies(for index: Int) {
    interactor.loadMovies(for: index)
  }
  
  func didSelect(movie: Movie) {
    router.showDetails(for: movie)
  }
  
  func showSearchController(for movies: [Movie]) {
    router.openSearchView(with: movies)
  }
  
  func getMoviesSuccess(_ moviesBase: MoviesBase) {
    view?.insertMovies(with: moviesBase)
  }
  
  func getMoviesError(_ error: NetworkFailure) {
    view?.showAlertOnFailure(title: AlertConstants.ALERT.rawValue, msg: error.localizedDescription)
  }
  
}
