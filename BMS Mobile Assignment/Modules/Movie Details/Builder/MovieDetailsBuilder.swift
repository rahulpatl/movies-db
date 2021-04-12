//
//  MovieDetailsBuilder.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

class MovieDetailsBuilder {
  func buildModule(with movie: Movie) -> MovieDetailsVC {
    let movieDetailsVC = MovieDetailsVC()
    let presenter = MovieDetailsPresenter(_movie: movie)
    let network = Network()
    let interactor = MovieDetailsInteractor(_network: network)
    let router = MovieDetailsRouter()
    
    presenter.view = movieDetailsVC
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    movieDetailsVC.presenter = presenter
    router.viewController = movieDetailsVC
    
    return movieDetailsVC
  }
}
