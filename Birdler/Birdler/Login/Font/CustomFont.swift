//
//  CustomFont.swift
//  Birdler
//
//  Created by Nayla on 30/3/2024.
//

import UIKit

extension UIFont {
    
    enum FontType {
        case black
        case blackItalic
        case bold
        case boldItalic
        case extraBold
        case extraBoldItalic
        case extraLight
        case extraLightItalic
        case italic
        case light
        case lightItalic
        case medium
        case mediumItalic
        case regular
        case semiBold
        case semiBoldItalic
        case thin
        case thinItalic
        
        func getFontName() -> String {
            switch self {
                
            case .black:
                return "DMSans-Black"
            case .blackItalic:
                return "DMSans-blackItalic"
            case .bold:
                return "DMSans-bold"
            case .boldItalic:
                return "DMSans-boldItalic"
            case .extraBold:
                return "DMSans-extraBold"
            case .extraBoldItalic:
                return "DMSans-extraBoldItalic"
            case .extraLight:
                return "DMSans-extraLight"
            case .extraLightItalic:
                return "DMSans-extraLightItalic"
            case .italic:
                return "DMSans-italic"
            case .light:
                return "DMSans-light"
            case .lightItalic:
                return "DMSans-lightItalic"
            case .medium:
                return "DMSans-medium"
            case .mediumItalic:
                return "DMSans-mediumItalic"
            case .regular:
                return "DMSans-regular"
            case .semiBold:
                return "DMSans-semiBold"
            case .semiBoldItalic:
                return "DMSans-semiBoldItalic"
            case .thin:
                return "DMSans-thin"
            case .thinItalic:
                return "DMSans-thinItalic"
            }
        }
        
        func getWeight() -> UIFont.Weight {
            switch self {
            case .medium:
                return .medium
            case .regular:
                return .regular
            case .black:
                return.black
            case .bold:
                return .bold
            case .light:
                return .light
            case .blackItalic:
                return .light
            case .boldItalic:
                return .light
            case .extraBold:
                return .light
            case .extraBoldItalic:
                return .light
            case .extraLight:
                return .light
            case .extraLightItalic:
                return .light
            case .italic:
                return .light
            case .lightItalic:
                return .light
            case .mediumItalic:
                return .light
            case .semiBold:
                return .light
            case .semiBoldItalic:
                return .light
            case .thin:
                return .light
            case .thinItalic:
                return .light
            }
        }
        
    }
    
    static func customFont(type: FontType,size: CGFloat) -> UIFont{
        _ = UIFont(name: type.getFontName(), size: size)
        return UIFont.systemFont(ofSize: size, weight: type.getWeight())
    }
    
    }


