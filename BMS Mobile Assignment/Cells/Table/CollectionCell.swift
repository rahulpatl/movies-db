//
//  CollectionCell.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

enum MovieDetailsType: String, CaseIterable {
  case Image = ""
  case Synopsis = "Synopsis"
  case Cast = "Casts"
  case Reviews = "Reviews"
  case SimilarMovies = "Similar Movies"
}

protocol CollectionCellProtocol: class {
  func didSelect(index: Int)
}

class CollectionCell: UITableViewCell {
  static let reuseId = "CollectionCell"
  @IBOutlet weak var collectionView: UICollectionView!
  private var casts = [Cast]()
  private var reviews = [MovieReview]()
  private var movies = [Movie]()
  private var detailsType: MovieDetailsType?
  weak var collectionCellDelegate: CollectionCellProtocol?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViews()
  }
  
  private func setupViews() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.registerCellWith(nibName: CastCell.reuseId)
    collectionView.registerCellWith(nibName: ReviewsCell.reuseId)
    collectionView.registerCellWith(nibName: MovieListCell.reuseId)
  }
  
  func setData(for _casts: [Cast]) {
    detailsType = .Cast
    casts = _casts
    collectionView.reloadData()
  }
  
  func setData(for _reviews: [MovieReview]) {
    detailsType = .Reviews
    reviews = _reviews
    collectionView.reloadData()
  }
  
  func setData(for _movies: [Movie], cellDelegate: CollectionCellProtocol? = nil) {
    if collectionCellDelegate == nil {
      collectionCellDelegate = cellDelegate
    }
    detailsType = .SimilarMovies
    movies = _movies
    collectionView.reloadData()
  }
}

extension CollectionCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch detailsType {
    case .Cast:
      return casts.count
      
    case .Reviews:
      return reviews.count
      
    case .SimilarMovies:
      return movies.count
      
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch detailsType {
    case .Cast:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCell.reuseId, for: indexPath) as? CastCell
      cell?.setCast(data: casts[indexPath.item])
      return cell!
      
    case .Reviews:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewsCell.reuseId, for: indexPath) as? ReviewsCell
      cell?.setReview(data: reviews[indexPath.item])
      return cell!
      
    case .SimilarMovies:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.reuseId, for: indexPath) as? MovieListCell
      cell?.updateMovie(of: movies[indexPath.item])
      return cell!
      
    default:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCell.reuseId, for: indexPath) as? CastCell
      cell?.setCast(data: casts[indexPath.item])
      return cell!
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch detailsType {
    case .Cast:
      return CGSize(width: 116, height: 170)
      
    case .Reviews:
      return CGSize(width: (UIScreen.main.bounds.width * 0.8), height: 140)
      
    case .SimilarMovies:
      return Constants.getMovieCellSize()
      
    default:
      return .zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch detailsType {
    case .SimilarMovies:
      collectionCellDelegate?.didSelect(index: indexPath.item)
      
    default:
      break
    }
  }
}
