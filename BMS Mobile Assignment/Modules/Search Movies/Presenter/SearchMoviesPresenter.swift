//
//  SearchMoviesPresenter.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

class SearchMoviesPresenter: SearchMoviesViewOutput {
  weak var view: SearchMoviesViewInput?
  var interactor: SearchMoviesInteractorInput?
  var router: SearchMoviesRouterInput?
  
  var movies = [Movie]()
  
  init(_movies: [Movie]) {
    movies = _movies
  }
  
  func getRecentAccessedData() {
    interactor?.getRecentData()
  }
  
  func showDetails(movie: Movie) {
    router?.showDetails(for: movie)
  }
  
  func search(text: String) {
    searchMovie(text: text)
  }
  
  private func searchMovie(text: String) {
    let splitedMoviesTitle = movies.map({$0.title.lowercased().split(separator: " ").sorted()})
    var resultMovies: [Movie: Int] = [:]
    let searchStrings = text.lowercased().split(separator: " ")
    for i in 0..<splitedMoviesTitle.count {
      for slicedSearchString in searchStrings {
        if binarySearch(string: slicedSearchString, array: splitedMoviesTitle[i]) {
          resultMovies[movies[i]] = (resultMovies[movies[i]] ??  0) + 1
        }
      }
    }
    let weightedBasedMovies = resultMovies.sorted { $0.1 > $1.1 }
    let data = weightedBasedMovies.map({$0.key})
    view?.searched(movies: data)
  }
  
  
  /// Performs binary search.
  /// - Parameters:
  ///   - searchString: String.SubSequence
  ///   - array: [String.SubSequence]
  /// - Returns: Bool
  private func binarySearch(string: String.SubSequence, array: [String.SubSequence]) -> Bool {
    var lowerBound = 0
    var upperBound = array.count - 1
    var middle = 0
    var found = false
    
    while(lowerBound <= upperBound) {
      middle = (lowerBound + upperBound) / 2
      
      if(array[middle].hasPrefix(string)) {
        found = true
        break
      } else if(array[middle] < string) {
        lowerBound = middle + 1
      } else {
        upperBound = middle - 1
      }
    }
    
    return found
  }
}


extension SearchMoviesPresenter: SearchMoviesInteractorOutput {
  func updateRecent(movies: [Movie]) {
    view?.recentAccessed(movies: movies)
  }
}
