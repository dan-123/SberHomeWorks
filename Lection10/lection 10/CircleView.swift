//
//  CircleView.swift
//  lection 10
//
//  Created by Даниил Петров on 20.05.2021.
//

import UIKit

final class CircleView: UIView {
   
    var internalCircleRadius: CGFloat
    
    init(internalCircleRadius: CGFloat) {
        self.internalCircleRadius = internalCircleRadius
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let color: UIColor = .systemYellow
        
        let rectangle = CGRect(x: internalCircleRadius/2, y: internalCircleRadius/2, width: rect.width-internalCircleRadius, height: rect.height-internalCircleRadius)
        let circle = UIBezierPath(roundedRect: rectangle, cornerRadius: rect.height/2)

        circle.lineWidth = internalCircleRadius
        
        color.setStroke()
        circle.stroke()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            let view = super.hitTest(point, with: event)
            if view === self {
                return nil
            }
            return view
        }
}
