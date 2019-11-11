//
//  TabBarController.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/9/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
         super.viewDidLoad()
         setupTabBar()
     }

    func setupTabBar() {
        // tab 1
        let tab1 = UINavigationController(rootViewController: FeedViewController())
        tab1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home.jpg"), tag: 0)

        // tab 2
        let tab2 = UINavigationController(rootViewController: MiscViewController())
        tab2.tabBarItem = UITabBarItem(title: "Misc", image: UIImage(named: "trending.jpg"), tag: 1)

        // tab 3
        let tab3 = UINavigationController(rootViewController: ProfileViewController())
        tab3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "account.jpg"), tag: 2)

        viewControllers = [tab1, tab2, tab3]
    }
}
