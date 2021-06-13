//
//  ViewElement.swift
//  Carthage
//
//  Created by Даниил Петров on 13.06.2021.
//

import UIKit

open class ViewElement: UIViewController {
    
    public var textLabel: UILabel = {
        let label = UILabel()
        label.text = "My carthage"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
}
