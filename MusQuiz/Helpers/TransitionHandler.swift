//
//  TransitionHandler.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import UIKit

protocol TransitionHandler: AnyObject {
    func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
    func present(_ viewControllerToPresent: UIViewController, animated: Bool)

    func push(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)

    func dismissViewController(animated: Bool, completion: (() -> Void)?)
    func dismissViewController(animated: Bool)
}

extension UIViewController: TransitionHandler {
    func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
        present(viewControllerToPresent, animated: animated, completion: nil)
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool) {
        navigationController?.popViewController(animated: true)
    }

    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        dismiss(animated: animated, completion: completion)
    }

    func dismissViewController(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
}
