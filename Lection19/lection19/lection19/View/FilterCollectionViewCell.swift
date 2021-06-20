//
//  FilterCollectionViewCell.swift
//  lection19
//
//  Created by Даниил Петров on 17.06.2021.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var imageWithFilterView: UIImageView = {
        let imageWithFilterView = UIImageView()
        
        imageWithFilterView.layer.cornerRadius = 10
        imageWithFilterView.contentMode = .scaleAspectFit
        imageWithFilterView.clipsToBounds = true
        imageWithFilterView.backgroundColor = .black
        imageWithFilterView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageWithFilterView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        autoresizesSubviews = true
        
        contentView.addSubview(imageWithFilterView)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            imageWithFilterView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageWithFilterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageWithFilterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageWithFilterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setImage(_ image: UIImage?) {
        imageWithFilterView.image = image
    }
}
