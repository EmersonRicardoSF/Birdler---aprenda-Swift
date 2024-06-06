//
//  NSAttributedString+Extension.swift
//  Birdler
//
//  Created by Nayla on 31/5/2024.
//

import Foundation

extension NSAttributedString {
    
    convenience init(chapterName: String) {
        let bodyContents = String(bundleName: "\(chapterName).html")

        // Merge the wrapper with this page's content.
        let finalHTML = String.wrapperHTMLNew().replacingOccurrences(of: "[BODY]", with: bodyContents)

        
        // Finally, replace any instances of [VIDEO-NUMBER] with the correct chapter and section.
//        finalHTML = finalHTML.replacingOccurrences(of: "[VIDEO-NUMBER]", with: chapterName)

        let data = Data(finalHTML.utf8)

        do {
            print("Fiz a conversão do capitulo")
            try self.init(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            fatalError("Unable to parse chapter: \(chapterName).")
        }
    }
}
