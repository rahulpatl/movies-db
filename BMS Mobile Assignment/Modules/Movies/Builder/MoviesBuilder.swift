//
//  MoviesBuilder.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation

protocol MoviesModuleBuilderProtocol: AnyObject {
    func buildModule() -> MoviesVC
}


final class MoviesBuilder: MoviesModuleBuilderProtocol {
    
  func buildModule() -> MoviesVC {
    let moviesVC = MoviesVC()
    let presenter = MoviesPresenter()
    let network = Network()
    let interactor = MoviesInteractor(_network: network)
    let router = MoviesRouter()
    
    presenter.view = moviesVC
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    moviesVC.presenter = presenter
    router.viewController = moviesVC
    
    return moviesVC
  }
}
