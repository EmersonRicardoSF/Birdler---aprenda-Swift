//
//  FirstGameVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 15/07/2024.
//

import UIKit

class FirstGameVC: UIViewController {
    
    var firstGameScreen: FirstGameScreen?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        firstGameScreen = FirstGameScreen()
        view = firstGameScreen
    }

}
