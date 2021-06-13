//
//  ViewController.swift
//  lection20
//
//  Created by Даниил Петров on 13.06.2021.
//

import UIKit
import Carthage

class ViewController: UIViewController {

    let viewElement = ViewElement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        setupTextLabel()
    }
    
    func setupTextLabel() {
        view.addSubview(viewElement.textLabel)
        
        viewElement.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewElement.textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            viewElement.textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            viewElement.textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            viewElement.textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
        
    }
}

