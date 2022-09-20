//
//  ImageViewerModuleBulder.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import UIKit

class ImageViewerModuleBuilder {
    static func build(temperature: Int) -> ImageViewerViewController {
        let interactor = ImageViewerInteractor(temperature: temperature)
        let router = ImageViewerRouter()
        let presenter = ImageViewerPresenter(interactor: interactor, router: router)
        let viewController = ImageViewerViewController(presenter: presenter)
        presenter.view = viewController
        interactor.presenter = presenter as? any ImageViewerInteractorProtocol
        router.viewController = viewController
        return viewController
    }
}
