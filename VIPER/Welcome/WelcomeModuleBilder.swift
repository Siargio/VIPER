//
//  WelcomeModuleBilder.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import UIKit

class WelcomeModuleBilder {
    static func build() -> ViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interactor: interactor, router: router)
        let viewController = ViewController(presenter: presenter)
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
