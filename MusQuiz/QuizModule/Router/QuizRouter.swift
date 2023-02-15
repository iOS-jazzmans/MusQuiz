//
//  QuizRouter.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import UIKit

final class QuizRouter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension QuizRouter: QuizRouterInput {
    var transitionHandler: TransitionHandler? {
        viewController
    }
}
