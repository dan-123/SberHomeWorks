//
//  NewsCell.swift
//  lection 17
//
//  Created by Даниил Петров on 06.06.2021.
//

import UIKit

final class NewsCell: UITableViewCell {

    static let indentifirer = "NewsCell"

    func configure(with model: Articles) {
        textLabel?.numberOfLines = 0
        textLabel?.text = model.title + " (\(model.source.name))"
    }
}
