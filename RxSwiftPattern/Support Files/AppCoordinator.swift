//
//  AppCoordinator.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start()  {
        
        let spyListViewController = LoginViewController.instantiate(name: .main)
        let navigationController = UINavigationController(rootViewController: spyListViewController)
//        spyListViewController.view.backgroundColor = .systemBlue
        navigationController.setNavigationBarHidden(true, animated: false)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}
