//
//  PoppinsFont.swift
//  Birdler
//
//  Created by Nayla on 10/4/2024.
//

import UIKit


extension UIFont {
    
    enum FontType3 {
        
        case semiBold
        
        func getFontName() -> String {
            switch self {
            case .semiBold:
                return "Poppins-SemiBold"
                
            }
        }
        
        func getWeight() -> UIFont.Weight {
            switch self {
            case .semiBold:
                return .semibold
           
            }
        }
        
    }
    
    static func  poppinsFont(type: FontType, size: CGFloat) -> UIFont{
        guard let font = UIFont(name: type.getFontName(), size: size) else{
            return UIFont.systemFont(ofSize: size)
        }
        
        return font
        
    }
}
