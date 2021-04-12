//
//  ReviewsCell.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class ReviewsCell: UICollectionViewCell {
  static let reuseId = "ReviewsCell"
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userImage: CustomImageView!
  @IBOutlet weak var reviewLabel: UILabel!
  @IBOutlet weak var parentView: UIView!
  @IBOutlet weak var reviewView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViews()
  }
  
  private func setupViews() {
    parentView.layer.cornerRadius = Constants.defaultRadius
    reviewView.layer.cornerRadius = Constants.defaultRadius
    userImage.layer.cornerRadius = Constants.defaultRadius
  }
  
  func setReview(data: MovieReview) {
    userImage.image = UIImage(with: .USER)
    if let value = data.authorDetails?.avatar_path {
      userImage.setImg(from: value)
    }
    userNameLabel.text = data.author
    reviewLabel.text = data.content
  }
}
