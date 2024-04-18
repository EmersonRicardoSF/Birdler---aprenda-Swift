//
//  ExerciseVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 18/04/2024.
//

import UIKit

class ExerciseVC: UIViewController {
    
    var exerciseScreen: ExerciseScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseScreen = ExerciseScreen()
        view = exerciseScreen
        view.backgroundColor = .red
    }
    
}
