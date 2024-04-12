//
//  DMSansFont.swift
//  Birdler
//
//  Created by Nayla on 2/4/2024.
//

import UIKit

extension UIFont {
    
    enum FontType {
        
        case bold
        case regular
        
        func getFontName() -> String {
            switch self {
            case .bold:
                return "DMSans-Bold"
            case .regular:
                return "DMSans-Regular"
                
            }
        }
        
        func getWeight() -> UIFont.Weight {
            switch self {
            case .bold:
                return .bold
            case .regular:
                return . regular
            }
        }
        
    }
    
    static func  dmsansFont(type: FontType, size: CGFloat) -> UIFont{
        guard let font = UIFont(name: type.getFontName(), size: size) else{
            return UIFont.systemFont(ofSize: size)
        }
        
        return font
        
    }
}
