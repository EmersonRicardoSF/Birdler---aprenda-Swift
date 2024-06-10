//
//  GenericExerciseVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 10/06/2024.
//

import UIKit

class GenericExerciseVC: UIViewController {
    
    var genericExerciseScreen: GenericExerciseScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        genericExerciseScreen = GenericExerciseScreen()
        view = genericExerciseScreen

    }
    

}
