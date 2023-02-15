//
//  QuizPresenter.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import Foundation

final class QuizPresenter {
    weak var view: QuizViewInput?
    weak var moduleOutput: QuizModuleOutput?
    
    private let interactor: QuizInteractorInput
    private let router: QuizRouterInput
    
    init(interactor: QuizInteractorInput,
         router: QuizRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension QuizPresenter: QuizViewOutput {
    func viewDidLoad() {
//        view?.changeBackgroundColor(to: .orange)
    }
}

//MARK: - ModuleInput
extension QuizPresenter: QuizModuleInput {}

//MARK: - InteractorOutput
extension QuizPresenter: QuizInteractorOutput {}
