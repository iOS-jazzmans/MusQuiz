//
//  Router.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 14.02.2023.
//

import UIKit

protocol Router: AnyObject {
    var transitionHandler: TransitionHandler? { get }

    func presentModule(withBuilder builder: ModuleBuilder,
                       animated: Bool,
                       completion: (() -> Void)?)
    func presentModule(withBuilder builder: ModuleBuilder, animated: Bool)
    func presentModuleInNavigationController(using builder: ModuleBuilder,
                                             animated: Bool,
                                             completion: (() -> Void)?)
    func presentModuleInNavigationController(using builder: ModuleBuilder,
                                             animated: Bool)

    func pushModule(withBuilder builder: ModuleBuilder, animated: Bool)
    func popModule(animated: Bool)

    func dismiss(animated: Bool)
}

extension Router {
    func presentModule(withBuilder builder: ModuleBuilder, animated: Bool, completion: (() -> Void)?) {
        guard let vc = builder.build() else {
            return
        }
        transitionHandler?.present(vc, animated: animated, completion: completion)
    }

    func presentModule(withBuilder builder: ModuleBuilder, animated: Bool) {
        guard let vc = builder.build() else {
            return
        }
        transitionHandler?.present(vc, animated: animated, completion: nil)
    }

    func pushModule(withBuilder builder: ModuleBuilder, animated: Bool) {
        guard let vc = builder.build() else {
            return
        }
        transitionHandler?.push(vc, animated: animated)
    }

    func popModule(animated: Bool) {
        transitionHandler?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool) {
        transitionHandler?.dismissViewController(animated: true)
    }

    func presentModuleInNavigationController(using builder: ModuleBuilder,
                                             animated: Bool,
                                             completion: (() -> Void)?) {
        guard let viewController = builder.build() else {
            return
        }
        let wrappedViewController = UINavigationController(rootViewController: viewController)
        transitionHandler?.present(wrappedViewController, animated: animated, completion: completion)
    }

    func presentModuleInNavigationController(using builder: ModuleBuilder,
                                             animated: Bool) {
        guard let viewController = builder.build() else {
            return
        }
        let wrappedViewController = UINavigationController(rootViewController: viewController)
        transitionHandler?.present(wrappedViewController, animated: true, completion: nil)
    }
}
