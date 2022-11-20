//
//  ANFProductItem.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/20/22.
//

import Foundation

struct ANFProductItem : Codable {
    
    /*
     JSON Data:
     1. backgroundImage
     a. The size of this can vary and the Image view should change size based on the size of the image
     provided.
     b. You can assume that image will always be the full width of the product card
     2. topDesccription
     a. Font Size: 13
     3. title
     a. Font Size: 17 (BOLD)
     4. promoMessage
     a. Font Size: 11
     5. bottomDescription
     a. Font Size: 13
     6. content
     a. Can contain zero or more Items. Each item in the list should be represented by a button
     i. Title
     1. Font Size: 15
     ii. Target
     1. The URL the button should link the user to
     */
    
    static func MakeProducts(from data: Data) -> [ANFProductItem] {
        var products = [ANFProductItem]()
        do {
            products = try JSONDecoder().decode([ANFProductItem].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return products
    }
    
    var title, backgroundImage: String
    var topDescription, bottomDescription, promoMessage: String?
    var content : [ANFProductContent]?
    
}
