//
//  AppDelegate.swift
//  lection19
//
//  Created by Даниил Петров on 17.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let filterService = FilterService()
        let imageModel = ImageModel()
        let imageFilterModel = ImageFilterModel()
        let filterModel = FilterModel()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController(filterService: filterService, imageModel: imageModel, imageFilterModel: imageFilterModel, filterModel: filterModel))
        window?.makeKeyAndVisible()
        
        return true
    }
}

