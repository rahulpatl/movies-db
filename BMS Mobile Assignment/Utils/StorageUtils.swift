//
//  StorageUtils.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation
class RecentMovies{
  var movies = [Movie]()
}

var moviesCache = NSCache<NSString, AnyObject>()
class StorageUtils {
  private var recentMovies = RecentMovies()
  private let key = "MOVIES"
  static let shared = StorageUtils()
  
  
  /// Returns the data stored in the cache.
  /// - Returns: [Movie]
  func getMovies() -> [Movie] {
    if let data = moviesCache.object(forKey: NSString(string: key)) as? RecentMovies {
      return data.movies
    } else {
      return []
    }
  }
  
  
  /// It stores the data using Cache with maximum 5 entries.
  /// - Parameter movie: [Movie]
  func storeRecent(movie: Movie) {
    recentMovies.movies = getMovies()
    if let index = recentMovies.movies.firstIndex(where: {$0.id == movie.id}) {
      recentMovies.movies.remove(at: index)
    }
    if recentMovies.movies.count < 5 {
      recentMovies.movies.append(movie)
    } else {
      recentMovies.movies.removeFirst()
      recentMovies.movies.append(movie)
    }
    moviesCache.setObject(recentMovies, forKey: NSString(string: key))
  }

}
