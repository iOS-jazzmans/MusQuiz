//
//  UIViewController+extensions.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 11.02.2023.
//

import UIKit

extension UIViewController {
    func showAlert(title: String,
                   message: String,
                   method: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK",
                               style: .default,
                               handler: method)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
