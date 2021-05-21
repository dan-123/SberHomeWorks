//
//  SecondViewController.swift
//  lection 10
//
//  Created by Даниил Петров on 20.05.2021.
//

import UIKit

final class SecondViewController: UIViewController {
    
    lazy var label: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Second view controller"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        view.addSubview(label)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        label.frame = .init(x: 0, y: 0, width: 300, height: 300)
        label.center = view.center
    }
}
