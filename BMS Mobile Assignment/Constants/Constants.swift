//
//  Constants.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import UIKit

enum Constants {
  static let screenWidth: CGFloat = UIScreen.main.bounds.width
  static let defaultSpacing: CGFloat = 1
  static let defaultPadding: CGFloat = 8
  static let numberOfColumns: CGFloat = 2
  static let defaultRadius: CGFloat = 8
  static let defaultPageNum: Int = 0
  static let defaultTotalCount: Int = 0
  static let defaultPageSize: Int = 20
  static func getMovieCellSize() -> CGSize {
    let spacing = Constants.defaultSpacing
    let cellWidth: CGFloat = (UIScreen.main.bounds.width / Constants.numberOfColumns) - (Constants.numberOfColumns - spacing) - 2
    let cellHeight: CGFloat = (cellWidth * 1.5) - Constants.defaultPadding
    return CGSize(width: cellWidth, height: cellHeight)
  }
}



enum Images: String {
  case SEARCH = "Search"
}

enum AlertConstants: String {
  case ALERT = "Alert"
}
