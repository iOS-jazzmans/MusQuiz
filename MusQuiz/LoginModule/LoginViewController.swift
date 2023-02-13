//
//  ViewController.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 11.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "Enter login".localized()
        label.font = .primaryText()
        view.addSubview(label)
    }
}

