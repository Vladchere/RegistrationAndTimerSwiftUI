//
//  SceneDelegate.swift
//  RegistrationAndTimerSwiftUI
//
//  Created by Vladislav on 31.07.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let starterView = StarterView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let user = DataManager.shared.loadUser()
            let userManager = UserManager(user: user)
            window.rootViewController = UIHostingController(
                rootView: starterView.environmentObject(userManager)
            )
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

