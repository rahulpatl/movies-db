//
//  UIImageX.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import UIKit

extension UIImage {
  convenience init(with name: Images) {
    self.init(named: name.rawValue)!
  }
}
