//
//  EditProfileVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/07/2024.
//

import UIKit

class EditProfileVC: UIViewController {
    
    var editProfileScreen: EditProfileScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileScreen?.delegate(delegate: self)

    }
    
    override func loadView() {
        editProfileScreen = EditProfileScreen()
        view = editProfileScreen
    }
    

}

extension EditProfileVC: EditProfileScreenProtocol {
    func tappedCadastrarButton() {
        
    }
    
    func tappedProfileImageButton() {
        
    }
    
    
}
