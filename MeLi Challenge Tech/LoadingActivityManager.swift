//
//  LoadingActivityManager.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 22/04/22.
//

import Foundation
import UIKit

class LoadingActivityManager: LoadingActivityManagerProtocol {
    
    var viewController = ViewController()
    
    func showLoadingActivity(loadingActivityMessage: String) {
        let alert = UIAlertController(title: nil, message: loadingActivityMessage, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func hideLoadingActivity() {
        viewController.dismiss(animated: false, completion: nil)
    }
}
