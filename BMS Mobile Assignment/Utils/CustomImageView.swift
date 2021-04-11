//
//  CustomImageView.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import UIKit
let imagesCache = NSCache<NSString, AnyObject>()
class CustomImageView: UIImageView {
  private let network = Network()
  var urlString: String?
  func setImg(from url: String) {
    urlString = url
    if let _image = imagesCache.object(forKey: NSString(string: url)) as? UIImage {
      image = _image
      return
    }
    
    if let value = urlString {
      network.request(value) { (result) in
        switch result {
        case let .success(response):
          self.set(imgData: response!, for: value.description)
        case .failure(_):
          self.image = nil
        }
      }
    }
  }
  
  func set(imgData: UIImage, for url: String) {
    DispatchQueue.main.async {
      self.image = imgData
      imagesCache.setObject(imgData, forKey: NSString(string: url.description))
    }
  }
}
