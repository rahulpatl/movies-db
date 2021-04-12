//
//  MovieDetailsInteractor.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

class MovieDetailsInteractor: MovieDetailsInteractorInput {
  weak var presenter: MovieDetailsInteractorOutput?
  private var network: Network?
  
  init(_network: Network) {
    network = _network
  }
  
  func loadMovieDetails(for id: Int) {
    fetchSynopsis(for: id)
    fetchReviews(for: id)
    fetchCredits(for: id)
    fetchMovies(for: id, pageNum: 1)
  }
  
  private func fetchSynopsis(for id: Int) {
    let endPoint = MovieServices.getSynopsisForMovie(id: id)
    _=network?.request(endPoint, objectType: MovieSynopsisBase.self, completion: { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case let .success(response):
        self.presenter?.getSynpopsisSuccess(response)
      case let .failure(error):
        self.presenter?.getError(error)
      }
    })
  }
  
  private func fetchReviews(for id: Int) {
    let endPoint = MovieServices.getReviewsForMovie(id: id)
    _=network?.request(endPoint, objectType: MovieReviewsModel.self, completion: { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case let .success(response):
        self.presenter?.getReviewsSuccess(response)
      case let .failure(error):
        self.presenter?.getError(error)
      }
    })
  }
  
  private func fetchCredits(for id: Int) {
    let endPoint = MovieServices.getCreditsForMovie(id: id)
    _=network?.request(endPoint, objectType: CreditsModel.self, completion: { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case let .success(response):
        self.presenter?.getCreditsSuccess(response)
      case let .failure(error):
        self.presenter?.getError(error)
      }
    })
  }
  
  private func fetchMovies(for id: Int, pageNum: Int) {
    let endPoint = MovieServices.getSimilarMoviesForMovie(id: id)
    _=network?.request(endPoint, objectType: MoviesBase.self, completion: { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case let .success(response):
        self.presenter?.getMoviesSuccess(response)
      case let .failure(error):
        self.presenter?.getError(error)
      }
    })
  }
}
