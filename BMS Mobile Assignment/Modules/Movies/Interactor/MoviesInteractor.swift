//
//  MoviesInteractor.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation

class MoviesInteractor: MoviesInteractorInput {
  private let network: Network
  weak var presenter: MoviesInteractorOutput?
  
  init(_network: Network) {
    network = _network
  }
  
  func loadMovies(for pageNum: Int) {
    let service = MovieServices.getMoviesFor(page: pageNum)
    _ = network.request(service, objectType: MoviesBase.self) { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case let .success(response):
        self.presenter?.getMoviesSuccess(response)
      case let .failure(error):
        self.presenter?.getMoviesError(error)
      }
    }
  }
}
