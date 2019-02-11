//
//  AppDelegate.swift
//  MeditationAppShowcase
//
//  Created by Bartlomiej Guminiak on 30/01/2019.
//  Copyright © 2019 Bartlomiej Guminiak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = container.homeViewController()
        window?.makeKeyAndVisible()

        return true
    }

    // MARK: - Privates

    private lazy var container: HomeContainer = {
        return Container()
    }()

}
