//
//  WelcomePresenter.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func buttonPressed()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol

    init(interactor: WelcomeInteractorProtocol, router: WelcomeRouterProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    func viewDidLoaded() {
        interactor.loadDate()
        interactor.loadWeather()
    }

    func buttonPressed() {
        let temperature = interactor.temperature
        router.openImage(for: temperature)
    }

    func didLoad(date: String?) {
        view?.showDate(date: date ?? "No date today")
    }

    func didLoad(weather: Int?) {
        let temperature = weather?.description ?? "No temperature"
        view?.showWeather(weather: temperature)
    }
}
