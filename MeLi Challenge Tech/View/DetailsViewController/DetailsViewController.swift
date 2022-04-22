//
//  DetailsViewController.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 20/04/22.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var labelCondition: UILabel!
    @IBOutlet weak var labelSoldQuantity: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var labelAvailableQuantity: UILabel!
    
    var txtCondition = ""
    var txtSoldQuantity = ""
    var txtTitle = ""
    var txtPrice = ""
    var txtURLImage = ""
    var txtAvailableQuantity = ""
    var txtPermalink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolbarSetup()
                
        labelCondition.text = txtCondition
        labelSoldQuantity.text = "\(txtSoldQuantity) vendidos"
        labelTitle.text = txtTitle
        labelPrice.text = "$ \(txtPrice)"
        labelAvailableQuantity.text = "(\(txtAvailableQuantity) disponibles)"

        let url = URL(string: txtURLImage)!
        DownloadImageManager.DownloadImage(url: url, img: imgMain)
         }
    
    func toolbarSetup(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @IBAction func btnBuyNow(_ sender: Any) {
        if let url = URL(string: txtPermalink) {
            UIApplication.shared.open(url)
        }
    }
    
}
