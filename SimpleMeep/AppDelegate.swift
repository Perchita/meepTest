//
//  AppDelegate.swift
//  SimpleMeep
//
//  Created by Jose on 21/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(Constants.googleApiKey)
        GMSPlacesClient.provideAPIKey(Constants.googleApiKey)
        return true
    }

}

