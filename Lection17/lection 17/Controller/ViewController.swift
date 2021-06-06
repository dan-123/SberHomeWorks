//
//  ViewController.swift
//  lection 17
//
//  Created by Даниил Петров on 06.06.2021.
//

import UIKit

final class ViewController: BaseViewController {
    
    // MARK: - Dependencies

    private let networkService: NewsNetworkServiceProtocol

    // MARK: - Init

    init(networkService: NewsNetworkServiceProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Properties

    private var dataSource = [Articles]()
    
    // MARK: - UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.indentifirer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        loadData()
    }
    
    // MARK: - Private methods
    
    private func configureUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadData() {
        isLoading = true
        self.networkService.getNews{ response in
            DispatchQueue.main.async {
                switch response {
                case .success(let data):
                    self.dataSource.append(contentsOf: data.articles)
                    self.tableView.reloadData()
                case .failure(let error):
                    self.showAlert(for: error)
                }
                self.isLoading = false
            }
        }
    }
    
    private func showAlert(for error: NetworkServiceError) {
        let alert = UIAlertController(title: "Опаньки, что-то пошло не так",
                                      message: message(for: error),
                                      preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(buttonOk)
        present(alert, animated: true)
    }
    
    private func message(for error: NetworkServiceError) -> String {
        switch error {
        case .network:
            return "Упал запрос"
        case .decodable:
            return "Не смогли распарсить"
        case .unauthorize:
            return "Вы не авторизованы"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.indentifirer, for: indexPath)
        (cell as? NewsCell)?.configure(with: dataSource[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = SecondViewController(networkService: networkService, article: dataSource[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}
