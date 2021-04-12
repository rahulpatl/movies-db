//
//  SearchMoviesRouter.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class SearchMoviesRouter: SearchMoviesRouterInput {
  weak var viewController: UIViewController?
  func showDetails(for movie: Movie) {
    let vc = MovieDetailsBuilder().buildModule(with: movie)
    viewController?.navigationController?.pushViewController(vc, animated: true)
  }
}
