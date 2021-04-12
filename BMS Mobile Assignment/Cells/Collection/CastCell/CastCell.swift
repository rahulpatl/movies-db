//
//  CastCell.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class CastCell: UICollectionViewCell {
  static let reuseId = "CastCell"
  @IBOutlet weak var castImage: CustomImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViews()
  }
  
  private func setupViews() {
    self.layer.cornerRadius = Constants.defaultRadius
    castImage.layer.cornerRadius = Constants.defaultRadius
  }
  
  func setCast(data: Cast) {
    castImage.image = nil
    if let value = data.profile_path {
      castImage.setImg(from: value)
    }
    nameLabel.text = data.name
  }
  
}
