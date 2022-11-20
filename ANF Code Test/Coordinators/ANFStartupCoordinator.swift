//
//  ANFStartupCoordinator.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation


final class ANFStartupCoordinator {
    
    var productProviderService: ANFProductProviderService
    
    init(provider: ANFProductProviderService = ANFProductProviderService()) {
        self.productProviderService = provider
    }
    
    func start() {
        self.productProviderService.getProductData() { products in
            
        }
    }
    
}
