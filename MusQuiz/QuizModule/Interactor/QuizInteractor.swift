//
//  QuizInteractor.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import Foundation
final class QuizInteractor {
    weak var output: QuizInteractorOutput?
}

extension QuizInteractor: QuizInteractorInput {}
