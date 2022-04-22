//
//  ViewController.swift
//  MeLi Challenge Tech
//1
//  Created by Arturo González on 20/04/22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var noSearchResultsView: UIView!
    
    private let viewPresenter = ViewPresenter(networkConnection: NetworkConnection())
    var productsArray: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        delegateAndDataSourceInit()
        
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productTableViewCell")
        
        noSearchResultsView.isHidden = true
    }
        
    func delegateAndDataSourceInit(){
        searchBar.delegate = self
        productTableView.delegate = self
        productTableView.dataSource = self
        viewPresenter.setViewDelegate(viewControllerDelegate: self)
    }
    
}

// MARK: SearchBar Setup
extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (!searchBar.text!.isEmpty){
            LoadingIndicatorManager.showAlert(message: "Cargando...", viewController: self)
            viewPresenter.searchQuery(query: searchBar.text!)
        }
    }
}

extension ViewController : ViewControllerProtocol {
    
    func getProductList(products: [Result]) {
        noSearchResultsView.isHidden = true
        productsArray = products
        productTableView.reloadData()
        LoadingIndicatorManager.hideAlert(viewController: self)
    }
    
    func getErrorGettingProductList(errorMessage: String) {
        print(errorMessage)
        LoadingIndicatorManager.hideAlert(viewController: self)

    }
    
    func emptyProductList() {
        noSearchResultsView.isHidden = false
        LoadingIndicatorManager.hideAlert(viewController: self)

    }
}

// MARK: TableView Setup
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productTableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController
        vc?.txtTitle = productsArray[indexPath.row].title!
        vc?.txtSoldQuantity = String(productsArray[indexPath.row].soldQuantity!)
        vc?.txtPrice = String(productsArray[indexPath.row].price!)
        vc?.txtCondition = productsArray[indexPath.row].condition!
        vc?.txtURLImage = productsArray[indexPath.row].thumbnail!
        vc?.txtAvailableQuantity = String(productsArray[indexPath.row].availableQuantity!)
        vc?.txtPermalink = productsArray[indexPath.row].permalink!

        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = productTableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as? ProductTableViewCell
                
        cell?.txtTitleProduct.text = productsArray[indexPath.row].title
        cell?.txtPriceProduct.text = "$\(productsArray[indexPath.row].price!)"
        
        if (productsArray[indexPath.row].shipping?.freeShipping == true){
            cell?.txtShipping.text = "Envío gratis"
        } else {
            cell?.txtShipping.text = ""
        }
                
        let url = URL(string: productsArray[indexPath.row].thumbnail!)!
       
        DownloadImageManager.DownloadImage(url: url, img: cell!.imgProduct)
         
        return cell!
    }
    
    func setCellLabelText(cellLabel: UILabel, text: String){
        cellLabel.text = text
    }
}
