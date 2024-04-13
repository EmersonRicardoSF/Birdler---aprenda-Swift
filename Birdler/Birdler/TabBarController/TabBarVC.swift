//
//  TabBarVC.swift
//  Birdler
//
//  Created by Nayla on 10/4/2024.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSomeTabBarItems()
        
    }
    
    func addSomeTabBarItems() {
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: HomeVC())
        let vc3 = UINavigationController(rootViewController: HomeVC())
        setViewControllers([vc1, vc2, vc3], animated: false)
        tabBar.tintColor = .systemOrange
        tabBar.unselectedItemTintColor = .lightGray.withAlphaComponent(0.5)
        tabBar.backgroundColor = .black.withAlphaComponent(0.8)
        
        
        guard let items = tabBar.items else {return}
        items[0].image = UIImage(named: "homeImage")
        items[1].image = UIImage(named: "swiftImage")
        items[2].image = UIImage(named: "macImage")
        items[0].title = ""
        items[1].title = ""
        items[2].title = ""
    }

}

