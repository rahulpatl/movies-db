//
//  SearchItemCell.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class SearchItemCell: UITableViewCell {
  static let reuseId = "SearchItemCell"
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var parentView: UIView!
  @IBOutlet weak var posterImage: CustomImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    parentView.layer.cornerRadius = Constants.defaultRadius
    posterImage.layer.cornerRadius = Constants.defaultRadius
    selectionStyle = .none
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func update(movie: Movie) {
    posterImage.image = nil
    titleLabel.text = movie.title
    if let path = movie.poster_path {
      posterImage.setImg(from: path)
    }
  }
  
}
