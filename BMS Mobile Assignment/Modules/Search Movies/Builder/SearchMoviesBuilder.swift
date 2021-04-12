//
//  SearchMoviesBuilder.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class SearchMoviesBuilder {
  func builder(movies: [Movie]) -> UIViewController {
    let vc = SearchMoviesVC()
    let presenter = SearchMoviesPresenter(_movies: movies)
    let interactor = SearchMoviesInteractor()
    let router = SearchMoviesRouter()
    
    presenter.view = vc
    vc.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.interactor = interactor
    router.viewController = vc
    return vc
  }
}
