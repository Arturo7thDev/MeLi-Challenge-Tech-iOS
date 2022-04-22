//
//  MockProduct.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 22/04/22.
//

import Foundation

class MockProduct: ProductManagerProtocol {
    
    func searchProducts(query: String, completion: @escaping (CompletionResult) -> Void) {
        
        
        
        let shipping = Shipping(freeShipping: true, mode: "fsdfds", tags: ["ds", "ew"], storePickUp: true)
        let result1 = Result(title: "Test", price: 20.00, availableQuantity: 2, soldQuantity: 1, condition: "new", permalink: "https://pbs.twimg.com/profile_images/1311763847775125516/mvBRhlDs_400x400.jpg", thumbnail: "https://pbs.twimg.com/profile_images/1311763847775125516/mvBRhlDs_400x400.jpg", shipping: shipping)
        let result2 = Result(title: "Test", price: 20.00, availableQuantity: 2, soldQuantity: 1, condition: "new", permalink: "https://pbs.twimg.com/profile_images/1311763847775125516/mvBRhlDs_400x400.jpg", thumbnail: "https://pbs.twimg.com/profile_images/1311763847775125516/mvBRhlDs_400x400.jpg", shipping: shipping)
        let resultArray = [result1,result2]
        
        completion(.success(resultArray))

        
        
    }


}

