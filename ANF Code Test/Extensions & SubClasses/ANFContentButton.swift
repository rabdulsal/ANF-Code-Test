//
//  ANFContentButton.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation
import UIKit

class ANFContentButton : UIButton {
    
    var anfContentTarget: String = ""
    
    func onButtonPress(_ sender: ANFContentButton) {
        guard let url = URL(string: sender.anfContentTarget) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
