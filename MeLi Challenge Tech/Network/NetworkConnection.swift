//
//  NetworkConnection.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 20/04/22.
//

import Foundation
import Alamofire

class NetworkConnection: ProductManagerProtocol {
    
    func searchProducts(query: String, completion: @escaping (CompletionResult) -> Void){
        
        let params: Parameters = [ "q": query]
        let baseURL: String = "https://api.mercadolibre.com/sites/MLA"
        let endPoint: String = "/search?/"
        
        AF.request(baseURL + endPoint, method: .get, parameters: params).responseDecodable(of: Product.self){
            (response) in
            if let result = response.value?.results{
                
                var productsArray: [Result] = []
                
                for product in result{
                    productsArray.append(product)
                }
                completion(.success(productsArray))
                
                if(productsArray.isEmpty){
                    completion(.empty)
                }                
            } else {
                completion(.failure((response.error?.errorDescription!)!))
            }
        }
    }
    
}

enum CompletionResult {
    case success([Result]?)
    case failure(String)
    case empty
}
