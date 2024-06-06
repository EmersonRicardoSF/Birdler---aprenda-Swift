//
//  String+Extension.swift
//  Birdler
//
//  Created by Nayla on 31/5/2024.
//

import Foundation
import UIKit

extension String {
    
    init(bundleName: String) {
        guard let url = Bundle.main.url(forResource: bundleName, withExtension: nil) else {
            fatalError("Unable to locate \(bundleName).")
        }

        guard let contents = try? String(contentsOf: url) else {
            fatalError("Unable to read \(bundleName).")
        }

        self = contents
    }
    
    static func wrapperHTMLNew() -> String {
        var wrapperContents: String
        
        // Replace relative URLs of images with absolute URLs.
   //     wrapperContents = wrapperContents.replacingOccurrences(of: "<img src=\"", with: "<img src=\"\(Bundle.main.resourceURL!)/")

        wrapperContents = String(bundleName: "HTMLWrapper-Slim.html")
        var styleContents = String(bundleName: "CSSWrapper.css")

        
        // Scale up fonts based on Dynamic Type.
        let metrics = UIFontMetrics(forTextStyle: .body)
        let scaledSize = metrics.scaledValue(for: 140)
        styleContents = styleContents.replacingOccurrences(of: "[FONTSIZE]", with: "\(scaledSize)")

        // Force images to be the natural screen width.
      //  styleContents = styleContents.replacingOccurrences(of: "[IMAGEWIDTH]", with: "\(width)px")

        // Now merge in our adjusted CSS with the main HTML wrapper.
        wrapperContents = wrapperContents.replacingOccurrences(of: "[STYLE]", with: styleContents)

        return wrapperContents
    }
}

