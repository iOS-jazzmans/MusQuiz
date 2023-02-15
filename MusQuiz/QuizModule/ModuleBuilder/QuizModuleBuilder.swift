//
//  QuizModuleBuilder.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import UIKit

final class QuizModuleBuilder {
    
       // MARK: Private properties
       
       private weak var output: QuizModuleOutput?
       
       // MARK: Lifecycle
       
       init(output: QuizModuleOutput?) {
           self.output = output
       }
}

// MARK: - ModuleBuilder

extension QuizModuleBuilder: ModuleBuilder {
    func build() -> UIViewController? {
        let viewController = QuizViewController()
        
        let interactor = QuizInteractor()
        
        let router = QuizRouter(viewController: viewController)
        
        let presenter = QuizPresenter(interactor: interactor, router: router)
        
        presenter.view = viewController
        presenter.moduleOutput = output
        
        interactor.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
