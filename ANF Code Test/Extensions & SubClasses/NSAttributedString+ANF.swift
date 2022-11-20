//
//  NSAttributedString+ANF.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    public static func MakeHyperlink(from htmlString: String?) -> NSAttributedString? {
        guard let string = htmlString, let stringData = string.data(using: .utf8) else {
            return nil
        }
        
        do {
            let attributed = try NSAttributedString(
                data: stringData,
                options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
            return attributed
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
}
