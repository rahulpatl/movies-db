//
//  MovieListCell.swift
//  MoviesInfo
//
//  Created by Rahul Patil on 11/04/21.
//

import UIKit

class MovieListCell: UICollectionViewCell {
  @IBOutlet weak var childView: UIView!
  @IBOutlet weak var movieName: UILabel!
  @IBOutlet weak var moviePoster: CustomImageView!
  @IBOutlet weak var bookButton: UIButton!
  static let reuseId = "MovieListCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    prepareUI()
  }
  
  private func prepareUI() {
    childView.layer.cornerRadius = Constants.defaultRadius
    bookButton.layer.cornerRadius = Constants.defaultRadius
  }
  
  func updateMovie(of data: Movie) {
    moviePoster.image = nil
    movieName.text = data.title
    if let value = data.poster_path {
      moviePoster.setImg(from: value)
    }
  }
  
  deinit {
    print("Out")
  }
}
