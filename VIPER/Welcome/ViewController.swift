//
//  ViewController.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)
}

class ViewController: UIViewController {
    var presenter: WelcomePresenterProtocol?

    // MARK: - UIElements

    private lazy var labelDate: UILabel = {
        let labelDate = UILabel()
        labelDate.font = .systemFont(ofSize: 30)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        return labelDate
    }()

    private lazy var labelWeather: UILabel = {
        let labelWeather = UILabel()
        labelWeather.font = .systemFont(ofSize: 40)
        labelWeather.translatesAutoresizingMaskIntoConstraints = false
        return labelWeather
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show image", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - Activ

    @objc private func buttonPressed() {
        presenter?.buttonPressed()
    }
    // MARK: - Initial

    init(presenter: WelcomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        setupHierarchy()
        setupLayout()
        view.backgroundColor = .systemGray
    }

    func setupHierarchy() {
        view.addSubview(labelWeather)
        view.addSubview(labelDate)
        view.addSubview(button)
    }

    func setupLayout() {
        labelDate.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        labelDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelDate.widthAnchor.constraint(equalToConstant: 400).isActive = true
        labelDate.heightAnchor.constraint(equalToConstant: 40).isActive = true

        labelWeather.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelWeather.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 100).isActive = true
        labelWeather.widthAnchor.constraint(equalToConstant: 60).isActive = true
        labelWeather.heightAnchor.constraint(equalToConstant: 40).isActive = true

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

// MARK: - Extension

extension ViewController: WelcomeViewProtocol {
    func showDate(date: String) {
        DispatchQueue.main.async {
            self.labelDate.text = date
        }
    }

    func showWeather(weather: String) {
        DispatchQueue.main.async {
            self.labelWeather.text = weather
        }
    }
}
