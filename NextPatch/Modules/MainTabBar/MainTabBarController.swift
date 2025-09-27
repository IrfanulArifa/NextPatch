//
//  MainTabBarController.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 04/08/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
}

extension MainTabBarController {
    func setupTabBar() {
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.barTintColor = .black
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black // Background hitam
        
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .systemGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        let vc1 = HomeViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let vc2 = FavoriteViewController()
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star"), tag: 1)
        
        let vc3 = ProfileViewController()
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "person"), tag: 3)
        
        viewControllers = [nav1, nav2, nav3]
    }
}
