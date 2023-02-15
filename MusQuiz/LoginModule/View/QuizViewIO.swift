//
//  QuizViewIO.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import Foundation

import UIKit

protocol QuizViewInput: AnyObject {
    //action. for example:
    func changeBackgroundColor(to color: UIColor)
}

protocol QuizViewOutput: AnyObject {
    func viewDidLoad()    
}

