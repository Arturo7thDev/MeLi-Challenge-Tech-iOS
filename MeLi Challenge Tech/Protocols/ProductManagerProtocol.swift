//
//  ProductManagerProtocol.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 22/04/22.
//

import Foundation

protocol ProductManagerProtocol {
    func searchProducts(query:String, completion: @escaping (CompletionResult) -> Void )
    
}
