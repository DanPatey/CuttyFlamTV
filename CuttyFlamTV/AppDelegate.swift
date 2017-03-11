//
//  AppDelegate.swift
//  CuttyFlamTV
//
//  Created by Dan Patey on 3/8/17.
//  Copyright © 2017 Dan Patey. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    
    var appController: TVApplicationController?
    static let TVBaseURL = "http://localhost:9001/images/matthijs.png"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        
        // Configure paths to TVJS and root of our server
        guard let javascriptURL = URL(string: AppDelegate.TVBootURL) else { fatalError("Unable to create NSURL") }
        appControllerContext.javaScriptApplicationURL = javascriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        // Start up our TVApplicationController
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)

        return true
    }
}
