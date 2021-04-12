//
//  MovieDetailsRouter.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class MovieDetailsRouter: MovieDetailsRouterInput {
  weak var viewController: UIViewController?
  func showMovieDetails(with movie: Movie) {
    let vc = MovieDetailsBuilder().buildModule(with: movie)
    viewController?.navigationController?.pushViewController(vc, animated: true)
  }
}
