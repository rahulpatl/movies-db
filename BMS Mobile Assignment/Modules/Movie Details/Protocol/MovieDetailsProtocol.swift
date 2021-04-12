//
//  MovieDetailsProtocol.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

// MARK: View
protocol MovieDetailsViewInput: AnyObject {
  var presenter: MovieDetailsViewOutput! { get set }
  func insertMovies(with model: MoviesBase)
  func showAlertOnFailure(title: String, msg: String)
  func reloadView(at index: Int, viewModel: MovieDetailsViewModel)
}

//MARK: Presenter
protocol MovieDetailsViewOutput: AnyObject {
  var view: MovieDetailsViewInput? { get set }
  var interactor: MovieDetailsInteractorInput! { get set }
  var router: MovieDetailsRouterInput! { get set }
  func getMovieDetails()
  func didSelectMovie(at index: Int)
}

protocol MovieDetailsInteractorOutput: AnyObject {
  func getSynpopsisSuccess(_ synopsisBase: MovieSynopsisBase)
  func getReviewsSuccess(_ reviewsBase: MovieReviewsModel)
  func getCreditsSuccess(_ creditsBase: CreditsModel)
  func getMoviesSuccess(_ moviesBase: MoviesBase)
  func getError(_ error: NetworkFailure)
}

//MARK: Interactor
protocol MovieDetailsInteractorInput: AnyObject {
  var presenter: MovieDetailsInteractorOutput? { get set }
  func loadMovieDetails(for id: Int)
}

//MARK: Router
protocol MovieDetailsRouterInput: AnyObject {
  func showMovieDetails(with movie: Movie)
}
