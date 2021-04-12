//
//  MoviesRouter.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import UIKit

class MoviesRouter: MoviesRouterInput {
  weak var viewController: UIViewController?
  
  func showDetails(for movie: Movie) {
    let vc = MovieDetailsBuilder().buildModule(with: movie)
    viewController?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func openSearchView(with movies: [Movie]) {
    let vc = SearchMoviesBuilder().builder(movies: movies)
    viewController?.navigationController?.pushViewController(vc, animated: true)
  }
}
