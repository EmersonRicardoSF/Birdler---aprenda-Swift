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
        let vc2 = UINavigationController(rootViewController: ExerciseVC())
        let vc3 = UINavigationController(rootViewController: NewsVC())
        setViewControllers([vc1, vc2, vc3], animated: false)
        tabBar.tintColor = .systemOrange
        tabBar.unselectedItemTintColor = .lightGray.withAlphaComponent(0.5)
        tabBar.backgroundColor = .black.withAlphaComponent(0.99)
        
        
        guard let items = tabBar.items else {return}
        items[0].image = UIImage(named: "homeIcon")
        items[1].image = UIImage(named: "swiftIcon")
        items[2].image = UIImage(named: "newsImageIcon")
        items[0].title = ""
        items[1].title = ""
        items[2].title = ""
    }

}

