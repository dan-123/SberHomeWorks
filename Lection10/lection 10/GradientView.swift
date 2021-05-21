//
//  GradientView.swift
//  lection 10
//
//  Created by Даниил Петров on 20.05.2021.
//

import UIKit

final class GradientView: UIView {
    
    var colors = [UIColor]() {
        didSet {
            updateColors()
        }
    }
    
    convenience init(roundedRect rect: CGRect, cornerRadius: CGFloat) {
        self.init(frame: .zero)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer {
        layer as? CAGradientLayer ?? CAGradientLayer()
    }
    
    private func updateColors() {
        gradientLayer.colors = colors.map {$0.cgColor}
    }
    
//    override func draw(_ rect: CGRect) {
//        
//        let offset: CGFloat = 200
//        let color: UIColor = .systemYellow
//        
//        let rectangle = CGRect(x: offset/2, y: offset/2, width: rect.width-offset, height: rect.height-offset)
//        let circle = UIBezierPath(roundedRect: rectangle, cornerRadius: rect.height/2)
//        
//        circle.lineWidth = offset
//        
//        color.setFill()
//        circle.fill()
//    }
}
