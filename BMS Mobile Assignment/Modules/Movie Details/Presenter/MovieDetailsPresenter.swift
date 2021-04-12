//
//  MovieDetailsPresenter.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsViewOutput {
  weak var view: MovieDetailsViewInput?
  var interactor: MovieDetailsInteractorInput!
  var router: MovieDetailsRouterInput!
  var viewModel = MovieDetailsViewModel()
  
  init(_movie: Movie) {
    viewModel.movie = _movie
  }
  
  func getMovieDetails() {
    interactor.loadMovieDetails(for: (viewModel.movie?.id)!)
  }
  
  func didSelectMovie(at index: Int) {
    router.showMovieDetails(with: viewModel.similarMovies[index])
  }
}

extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
  func getSynpopsisSuccess(_ synopsisBase: MovieSynopsisBase) {
    DispatchQueue.main.async {
      self.viewModel.synopsis = synopsisBase
      self.view?.reloadView(at: 0, viewModel: self.viewModel)
      self.view?.reloadView(at: 1, viewModel: self.viewModel)
    }
  }
  
  func getReviewsSuccess(_ reviewsBase: MovieReviewsModel) {
    DispatchQueue.main.async {
      if let value = reviewsBase.results {
        self.viewModel.reviews = value
        self.view?.reloadView(at: 3, viewModel: self.viewModel)
      }
    }
  }
  
  func getCreditsSuccess(_ creditsBase: CreditsModel) {
    DispatchQueue.main.async {
      self.viewModel.credits = creditsBase
      self.view?.reloadView(at: 2, viewModel: self.viewModel)
    }
  }
  
  func getMoviesSuccess(_ moviesBase: MoviesBase) {
    DispatchQueue.main.async {
      if let value = moviesBase.results {
        self.viewModel.similarMovies = value
        self.view?.reloadView(at: 4, viewModel: self.viewModel)
      }
    }
  }
  
  func getError(_ error: NetworkFailure) {
    
  }
}
