//
//  MeLiChallengeTechTests.swift
//  MeLiChallengeTechTests
//
//  Created by Arturo González on 21/04/22.
//

import XCTest
@testable import MeLi_Challenge_Tech

class MeLiChallengeTechTests: XCTestCase {
    
    var viewController = ViewController()
    var networkConnection = NetworkConnection()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_memoryleakss(){
        let networkConnection = NetworkConnection()
        let vc = ViewController()
        let presenter = ViewPresenter(networkConnection: networkConnection)
        
        presenter.setViewDelegate(viewControllerDelegate: vc)
        
        networkConnection.searchProducts(query: "") { result in
            switch result {
            case .success(let array):
                XCTAssertNotNil(array)
                //self?.vc?.getProductList(products: array)
            case .failure(let aFError):
                XCTAssertNotNil(aFError)

                //self?.viewControllerDelegate?.getErrorGettingProductList(errorMessage: aFError)
            case .empty:
                print("gdf")
                //self?.viewControllerDelegate?.emptyProductList()
            }
        }
        
        addTeardownBlock { [weak vc, weak presenter, weak networkConnection] in
            XCTAssertNil(vc)
            XCTAssertNil(presenter)
            XCTAssertNil(networkConnection)

        }
    }
    
    func test_memoryLeaksClasses(){
        let networkConnection = NetworkConnection()
        let vc = ViewController()
        let presenter = ViewPresenter(networkConnection: networkConnection)
        
        presenter.setViewDelegate(viewControllerDelegate: vc)
        
        addTeardownBlock { [weak vc, weak presenter, weak networkConnection] in
            XCTAssertNil(vc)
            XCTAssertNil(presenter)
            XCTAssertNil(networkConnection)

        }
    }
    
    func test_success_search_products(){
        let mockProducts = MockProduct()
        let vc = ViewController()
        let presenter = ViewPresenter(networkConnection: networkConnection)
        
        presenter.setViewDelegate(viewControllerDelegate: vc)
        
        mockProducts.searchProducts(query: "jhghj") { result in
            switch result {
            case .success(let array):
                XCTAssertNotNil(array)
            case .failure(let aFError):
                break
            case .empty:
               break
            }
        }
    }
    
   

}

