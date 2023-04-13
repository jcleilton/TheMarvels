//
//  ListViewController.swift
//  TheMarvels
//
//  Created by Cleilton on 13/04/23.
//

import UIKit

final class ListViewController: UIViewController {
    
    private var theView: ListView? {
        view as? ListView
    }
    
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel = ListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewModel.didFinish = { [weak self] heroes in
            self?.list(heroes: heroes)
        }
        
        viewModel.onError = { [weak self] errorMessage in
            self?.showError(message: errorMessage)
        }
        
        viewModel.fetch()
    }
    
    private func list(heroes: [HeroModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            // implementation must be done
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(scrollView)
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(stackView)
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30).isActive = true
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30).isActive = true
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -30).isActive = true
            heroes.forEach { hero in
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = hero.image
                imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
                stackView.addArrangedSubview(imageView)
            }
        }
    }
    
    private func showError(message: String) {
        print(message)
    }
}
