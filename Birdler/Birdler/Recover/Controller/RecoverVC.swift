//
//  RecoverVC.swift
//  Birdler
//
//  Created by Emerson Ricardo Saia Filho on 11/04/24.
//

import UIKit

class RecoverVC: UIViewController {
    
    var recoverScreen: RecoverScreen?
    override func loadView() {
        recoverScreen = RecoverScreen()
        self.view = recoverScreen
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension RecoverVC: RecoverScreenProtocol {
    func customNavigation() {
    }
}
