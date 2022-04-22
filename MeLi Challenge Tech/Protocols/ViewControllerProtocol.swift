//
//  ViewControllerDelegate.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 20/04/22.
//

import Foundation

protocol ViewControllerProtocol: AnyObject {
    func getProductList(products: [Result])
    func getErrorGettingProductList(errorMessage: String)
    func emptyProductList()
}
