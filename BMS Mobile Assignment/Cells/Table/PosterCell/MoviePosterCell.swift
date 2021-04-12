//
//  MoviePosterCell.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class MoviePosterCell: UITableViewCell {
  static let reuseId = "MoviePosterCell"
  @IBOutlet weak var posterImage: CustomImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  func update(data: MovieSynopsisBase) {
    posterImage.image = nil
    if let value = data.backdrop_path {
      posterImage.setImg(from: value)
    }
    titleLabel.text = data.title
  }
  
  func setPoster(url: String) {
    posterImage.image = nil
    posterImage.setImg(from: url)
  }
}
