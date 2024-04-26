import UIKit

extension UIFont {
    
    
    enum FontType2 {
        
        case bold
        case medium
        
        func getFontName2() -> String {
            switch self {
            case .bold:
                return "Urbanist-bold"
            case .medium:
                return "Urbanist-medium"
                
            }
        }
        
        func getWeight() -> UIFont.Weight {
            switch self {
            case .bold:
                    .bold
            case .medium:
                    .medium
            }
        }
    }
    
    static func  urbanistFont(type: FontType2, size: CGFloat) -> UIFont{
        guard let font = UIFont(name: type.getFontName2(), size: size) else{
            return UIFont.systemFont(ofSize: size, weight: type.getWeight())
        }
        
        return font
        
    }
}
