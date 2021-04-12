//
//  SynopsisCell.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class SynopsisCell: UITableViewCell {
  static let reuseId = "SynopsisCell"
  @IBOutlet weak var synopsisLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func setSynopsis(data: MovieSynopsisBase) {
    synopsisLabel.text = data.overview ?? "-"
  }
}
