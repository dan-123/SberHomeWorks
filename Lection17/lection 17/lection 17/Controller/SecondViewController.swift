//
//  SecondViewController.swift
//  lection 17
//
//  Created by Даниил Петров on 06.06.2021.
//

import UIKit

final class SecondViewController: BaseViewController {
    
    // MARK: - Dependencies
    private let networkService: NewsNetworkServiceProtocol
    private let article: Articles


    // MARK: - Init

    init(networkService: NewsNetworkServiceProtocol, article: Articles) {
        self.networkService = networkService
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var newsTitleLabel: UILabel = {
        let newsTitleLabel = UILabel()
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.text = article.title
        newsTitleLabel.font = .boldSystemFont(ofSize: 20)
        return newsTitleLabel
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "newspaper")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var newsTextLabel: UILabel = {
        let newsTextLabel = UILabel()
        newsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTextLabel.numberOfLines = 0
        newsTextLabel.text = article.description
        return newsTextLabel
    }()
    
    // MARK: - Lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureUI()
        loadData()
    }
    
    // MARK: - Private methods

    private func configureUI() {
        view.addSubview(newsTitleLabel)
        view.addSubview(imageView)
        view.addSubview(newsTextLabel)
        
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            newsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            newsTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            imageView.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 24),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.6),
            
            newsTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            newsTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            newsTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func loadData() {
        guard let imageUrl = article.urlToImage else {
            return
        }
        self.isLoading = true
        networkService.loadImage(imageUrl: imageUrl) { data in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    self.isLoading = false
                }
            }
        }
    }
}
