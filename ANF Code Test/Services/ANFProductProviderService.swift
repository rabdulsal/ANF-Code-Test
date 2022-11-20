//
//  ANFProductProviderService.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation

final class ANFProductProviderService {
    
    var networkingService: ANFProductRequestService
    var productData = [ANFProductItem]()
    
    init(networkingService: ANFProductRequestService = ANFProductRequestService()) {
        self.networkingService = networkingService
    }
    
    func getProductData(completion: @escaping (_ products: [ANFProductItem])->Void) {
        self.networkingService.getProductData(completion: { products, error in
            // TODO: ProductItem
            
            completion(products)
        })
    }
}
