//
//  SceneDelegate.swift
//  MusQuiz
//
//  Created by Konstantin Grachev on 11.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let quizModuleBuider = QuizModuleBuilder(output: nil)
        guard let vc = quizModuleBuider.build() else { return }
        let navigationViewController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationViewController
    }
}

