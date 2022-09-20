//
//  ImageViewErViewController.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import UIKit

protocol ImageViewerViewProtocol: AnyObject {
    func showImage(image: UIImage?)
}

class ImageViewerViewController: UIViewController {

    // MARK: - Public

    var presenter: ImageViewerPresenterProtocol?

    private var ImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.backgroundColor = .black
        return ImageView
    }()

    init(presenter: ImageViewerPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        initialize()
        setupHierarchy()
        setupLayout()
        view.backgroundColor = .systemGray
    }

    func setupHierarchy() {
        view.addSubview(ImageView)
    }

    func setupLayout() {
        ImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ImageView.topAnchor.constraint(equalTo: view.topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - Private functions

private extension ImageViewerViewController {
    func initialize() {
    }
}

// MARK: - ImageViewerViewProtocol

extension ImageViewerViewController: ImageViewerViewProtocol {
    func showImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.ImageView.image = image
        }
    }
}
