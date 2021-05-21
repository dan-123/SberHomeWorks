//
//  ViewController.swift
//  lection 10
//
//  Created by Даниил Петров on 19.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var gradientView: GradientView = {
        let view = GradientView(frame: .zero)
        view.colors = [.systemRed, .systemGreen, .systemBlue]
        return view
    }()
    
    lazy var buttonSecondViewController: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.alpha = 0.8
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var circle: CircleView = {
        let view = CircleView(internalCircleRadius: 100)
        view.backgroundColor = .clear
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow

        view.addSubview(gradientView)
        view.addSubview(buttonSecondViewController)
        view.addSubview(circle)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        gradientView.frame = view.bounds
        
        circle.frame = .init(x: 0, y: 0, width: 350, height: 350)
        circle.center = view.center
        
        buttonSecondViewController.frame = .init(x: 0, y: 0, width: (circle.layer.bounds.height - circle.internalCircleRadius*2), height: (circle.layer.bounds.height - circle.internalCircleRadius*2))
        buttonSecondViewController.center = view.center
        buttonSecondViewController.layer.cornerRadius = buttonSecondViewController.layer.bounds.height/2
    }
    
    @objc func buttonTapped() {
        present(SecondViewController(), animated: true, completion: nil)
    }
}

