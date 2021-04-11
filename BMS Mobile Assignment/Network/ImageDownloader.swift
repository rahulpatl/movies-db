//
//  ImageDownloader.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 11/04/21.
//

import Foundation

class ImageDownloader {
  lazy var downloadQueue: OperationQueue = {
    var queue = OperationQueue()
    queue.name = "download_queue"
    return queue
  }()
}

class DownloadImage: Operation {
  let url: URL
  
  init(_url: URL) {
    url = _url
  }
  
  override func main() {
    if isCancelled {
      return
    }
    
    guard let imageData = try? Data(contentsOf: url) else {
      return
    }
    
    if isCancelled {
      return
    }
  }
}
