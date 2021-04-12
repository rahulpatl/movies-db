//
//  MovieDetailsViewModel.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation

class MovieDetailsViewModel {
  var movie: Movie?
  var synopsis: MovieSynopsisBase?
  var credits: CreditsModel?
  var reviews: [MovieReview] = []
  var similarMovies: [Movie] = []
}
