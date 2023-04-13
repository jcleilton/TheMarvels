//
//  MainCoordinator.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import UIKit

final class MainCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let controller = ViewController()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
}
