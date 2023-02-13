//
//  String+extensions.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 11.02.2023.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
