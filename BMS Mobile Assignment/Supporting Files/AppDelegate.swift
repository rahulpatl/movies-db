//
//  AppDelegate.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 10/04/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    showRoot()
    return true
  }
  
  func showRoot() {
    let vc = MoviesBuilder().buildModule()
    let nc = UINavigationController(rootViewController: vc)
    window?.rootViewController = nc
    window?.makeKeyAndVisible()
  }

}

