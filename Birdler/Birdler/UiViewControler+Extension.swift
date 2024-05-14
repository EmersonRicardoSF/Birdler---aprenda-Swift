//
//  UiViewControler+Extension.swift
//  Birdler
//
//  Created by Nayla on 27/4/2024.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {
    
    func openSafariPageWith(url: String) {
        let vc = SFSafariViewController(url: URL(string: url)!)
        vc.preferredControlTintColor = .systemPurple
        self.present(vc, animated: true)
        
    }
    
}

