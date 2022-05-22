//
//  AppCoordinator.swift
//  Movies
//
//  Created by Arman on 23.05.2022.
//

import UIKit

class AppCoordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = ViewController()
        klj
        window.makeKeyAndVisible()
    }
}
