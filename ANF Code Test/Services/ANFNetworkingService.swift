//
//  ANFNetworkingService.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/19/22.
//

import Foundation

final class ANFProductRequestService : ANFNetworkRequestable {
    
    var urlStr: String = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
    
    func getProductData(completion: @escaping (_ products: [ANFProductItem], _ error: Error?)->Void) {
        
        self.getResource { data, error in
            if let e = error {
                
                return
            }
            guard let data = data else {
                return
            }
//            var products = [ANFProductItem]()
//            do {
//                products = try JSONDecoder().decode([ANFProductItem].self, from: data)
//            } catch {
//                print("Error: \(error.localizedDescription)")
//            }
            
            completion(ANFProductItem.MakeProducts(from: data),nil)
        }
    }
}
