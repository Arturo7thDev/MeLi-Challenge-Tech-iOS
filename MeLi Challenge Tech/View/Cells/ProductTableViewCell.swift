//
//  ProductTableViewCell.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 20/04/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var txtTitleProduct: UILabel!
    @IBOutlet weak var txtPriceProduct: UILabel!
    @IBOutlet weak var txtShipping: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
