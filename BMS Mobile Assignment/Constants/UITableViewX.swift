//
//  UITableViewX.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

extension UITableView {
  func registerCellWith(nibName: String) {
    register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
  }
}

extension UICollectionView {
  func registerCellWith(nibName: String) {
    register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
  }
}
