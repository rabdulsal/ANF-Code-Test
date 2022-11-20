//
//  ANFProductContentDataCell.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation
import UIKit

/// TableViewCell
class ANFProductContentDataCell : UITableViewCell, ANFIdentifiable {
    
    @IBOutlet weak var contentButton: ANFContentButton!
    @IBAction func pressedContentButton(_ sender: ANFContentButton) {
        self.contentButton.onButtonPress(sender)
    }
    
    func configure(_ contentData: ANFProductContent) {
        
        contentButton.setTitle(contentData.title, for: .normal)
        contentButton.setTitleColor(.lightGray, for: .normal)
        contentButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        contentButton.anfContentTarget = contentData.target
        contentButton.layer.borderWidth = 2.0
        contentButton.layer.borderColor = UIColor.lightGray.cgColor
        contentButton.layer.cornerRadius = 3.0
    }
    
    
}
