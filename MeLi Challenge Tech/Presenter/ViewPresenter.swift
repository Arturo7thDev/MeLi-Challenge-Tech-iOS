//
//  ViewPresenter.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 20/04/22.
//

import Foundation

class ViewPresenter {
    
    private let networkConnection: NetworkConnection
    weak private var viewControllerDelegate: ViewControllerProtocol?
    
    init(networkConnection : NetworkConnection){
        self.networkConnection = networkConnection
    }
    
    func setViewDelegate(viewControllerDelegate: ViewControllerProtocol?){
        self.viewControllerDelegate = viewControllerDelegate
    }
    
    func searchQuery(query:String){
        self.networkConnection.searchProducts(query: query) { [weak self] completionResult in
            switch completionResult {
            case .success(let array):
                self?.viewControllerDelegate?.getProductList(products: array! ?? [])
            case .failure(let aFError):
                self?.viewControllerDelegate?.getErrorGettingProductList(errorMessage: aFError)
            case .empty:
                self?.viewControllerDelegate?.emptyProductList()
            }
        }
    }
}
