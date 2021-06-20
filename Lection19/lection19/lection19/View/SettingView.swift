//
//  SettingView.swift
//  lection19
//
//  Created by Даниил Петров on 17.06.2021.
//

import UIKit

class SettingView: UIView {
    
    // MARK: - Properties
    
    lazy var intensityLabel: UILabel = {
        let intensityLabel = UILabel()
        
        intensityLabel.font = UIFont.systemFont(ofSize: 20)
        intensityLabel.text = "Интенсивность"
        intensityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return intensityLabel
    }()
    
    lazy var slider: UISlider = {
       let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 1
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }()
    
    lazy var filterButton: UIButton = {
        let filterButton = UIButton()
        
        filterButton.setTitle("Выбрать фильтр", for: .normal)
        filterButton.backgroundColor = .gray
        filterButton.layer.borderColor = UIColor.black.cgColor
        filterButton.layer.borderWidth = 1
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        return filterButton
    }()
    
    lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .gray
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.layer.borderWidth = 1
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        return saveButton
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(intensityLabel)
        addSubview(slider)
        addSubview(filterButton)
        addSubview(saveButton)
        
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            intensityLabel.topAnchor.constraint(equalTo: topAnchor),
            intensityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            intensityLabel.widthAnchor.constraint(equalToConstant: 150),
            intensityLabel.bottomAnchor.constraint(lessThanOrEqualTo: filterButton.topAnchor, constant:  -16),
            
            slider.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            slider.leadingAnchor.constraint(equalTo: intensityLabel.trailingAnchor, constant: 16),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor),
            slider.bottomAnchor.constraint(equalTo: intensityLabel.bottomAnchor),
            
            filterButton.topAnchor.constraint(greaterThanOrEqualTo: intensityLabel.bottomAnchor, constant: 16),
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            filterButton.widthAnchor.constraint(equalToConstant: 150),
            
            saveButton.topAnchor.constraint(equalTo: filterButton.topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
