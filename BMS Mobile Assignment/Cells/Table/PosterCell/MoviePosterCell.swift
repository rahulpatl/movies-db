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
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  func setPoster(url: String) {
    posterImage.image = nil
    posterImage.setImg(from: url)
  }
  
}
