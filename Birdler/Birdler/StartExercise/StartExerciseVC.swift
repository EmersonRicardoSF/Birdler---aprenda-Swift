//
//  StartExerciseVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 03/07/2024.
//

import UIKit

class StartExerciseVC: UIViewController {
    
    var startExerciseScreen: StartExerciseScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        startExerciseScreen?.delegate(delegate: self)
        
    }
    
    override func loadView() {
        startExerciseScreen = StartExerciseScreen()
        view = startExerciseScreen
    }
    
}

extension StartExerciseVC: StartExerciseScreenProtocol {
    func customNavigation() {
        let vc: FirstGameVC = FirstGameVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


