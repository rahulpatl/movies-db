//
//  SearchMoviesInteractor.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

class SearchMoviesInteractor: SearchMoviesInteractorInput {
  var presenter: SearchMoviesInteractorOutput?
  
  func getRecentData() {
    let movies = StorageUtils.shared.getMovies().reversed()
    presenter?.updateRecent(movies: Array(movies))
  }
}
