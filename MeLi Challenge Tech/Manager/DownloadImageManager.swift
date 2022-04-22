//
//  DownloadImageManager.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 22/04/22.
//

import Foundation
import UIKit

class DownloadImageManager {
    
    static func DownloadImage(url: URL, img: UIImageView){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    img.image = UIImage(data: data)
                }
            }
        }
    }

}
