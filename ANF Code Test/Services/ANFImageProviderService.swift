//
//  ANFImageProviderService.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/20/22.
//

import Foundation
import UIKit

/// Service object in charge of fetching and returning Image objects from the web
final class ANFImageProviderService : ANFNetworkRequestable {
    static var ImageCache = NSCache<NSURL,UIImage>()
    var urlStr: String
    
    init(urlStr: String) {
        self.urlStr = urlStr
    }
    
    func fetchImage(completion: @escaping (_ image: UIImage?, _ error: Error?)->Void) {
        
        // Try via ImageCache
        if let url = URL(string: self.urlStr) as? NSURL, let cachedImg = Self.ImageCache.object(forKey: url) {
            completion(cachedImg,nil)
            return
        }
        
        self.getResource { data, error in
            if let e = error {
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            self.cacheImageAndURL(image, url: URL(string: self.urlStr), completion: completion)
        }
    }
}

private extension ANFImageProviderService {
    func cacheImageAndURL(_ image: UIImage, url: URL?, completion: @escaping (_ image: UIImage?, _ error: Error?)->Void) {
        guard let url = url as? NSURL else { return }
        Self.ImageCache.setObject(image, forKey: url)
        DispatchQueue.main.async {
            completion(image,nil)
        }
    }
}
