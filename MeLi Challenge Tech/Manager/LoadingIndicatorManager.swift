//
//  LoadingIndicatorManager.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 22/04/22.
//

import Foundation
import UIKit

class LoadingIndicatorManager {
    static func showAlert(message: String, viewController: UIViewController){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func hideAlert(viewController: UIViewController){
        viewController.dismiss(animated: false, completion: nil)
    }
}
