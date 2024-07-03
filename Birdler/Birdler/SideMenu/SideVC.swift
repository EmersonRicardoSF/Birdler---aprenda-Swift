//
//  SideVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 03/07/2024.
//
//

import UIKit

class SideVC: UIViewController {
    
    var sideScreen: SideScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
       
    }
    
    override func loadView() {
        sideScreen = SideScreen()
        view = sideScreen
    }

}
