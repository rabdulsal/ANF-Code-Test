//
//  ANFNetworkRequestable.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/21/22.
//

import Foundation

typealias ANFFetchResourceHandler = (_ data: Data?, Error?)->Void

protocol ANFNetworkRequestable {
    
    var urlStr: String { get set }
}

extension ANFNetworkRequestable {
    func getResource(completion: @escaping (ANFFetchResourceHandler)) {
        
        guard let url = URL(string: urlStr) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, err in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode  == 200 else {
                return
            }

            DispatchQueue.main.async {
                completion(data,nil)
            }
        }).resume()
    }
}
