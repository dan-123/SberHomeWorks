//
//  ViewController.swift
//  lection 11
//
//  Created by Даниил Петров on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    enum ChangeText {
        case more
        case less
    }
    
    let text = "Флэш - имя, которое носили несколько вымышленных супергероев комиксов компании DC Comics. Созданный автором Гарднером Фоксом и художником Гарри Лэмпертом, первый Флэш впервые появился в выпуске Flash Comics № 1 (январь 1940). Флэш обладает способностью развивать скорость, превышающую скорость света, и использовать сверхчеловеческие рефлексы, что нарушает некоторые законы физики."
    
    var textSize: CGFloat = 20
    
    lazy var shareButton: UIButton = {
        let shareButton = UIButton(type: .custom)
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(animateButton), for: .touchUpInside)
        shareButton.tintColor = .black
        
        return shareButton
    }()
    
    lazy var picture: UIImageView = {
        let image = UIImageView(image: UIImage(named: "flash"))
        return image
    }()
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        textLabel.text = text
        textLabel.font = textLabel.font.withSize(textSize)
        textLabel.numberOfLines = 0
        return textLabel
    }()
    
    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        setupShareButton()
        setupPicture()
        setupTextLabel()
    }
    
    // MARK: - Auto Layout
    
    func setupShareButton() {
        view.addSubview(shareButton)
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shareButton.widthAnchor.constraint(equalTo: shareButton.heightAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 32),
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            shareButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8)
        ])
    }
    
    func setupPicture() {
        view.addSubview(picture)
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            picture.widthAnchor.constraint(equalTo: picture.heightAnchor),
            picture.widthAnchor.constraint(equalToConstant: 128),
            picture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            picture.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8)
        ])
    }
    
    func setupTextLabel() {
        view.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: picture.layoutMarginsGuide.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
            textLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
    }
    
    // MARK: - Methods
    
    func changeTextSize(_ change: ChangeText) {
        switch change {
        case .more:
            textSize += 2
            textLabel.font = textLabel.font.withSize(textSize)
        case .less:
            textSize -= 2
            textLabel.font = textLabel.font.withSize(textSize)
        }
    }

    // MARK: - UIActivityViewController
    
    @objc func shareButtonTapped() {
        
        var item = [Any]()
        
        if let shareText = textLabel.text {
            item.append(shareText)
        }
        
        if let image = picture.image {
            item.append(image)
        }
        
        let textMagnification = CustomActivity(title: "Увеличить текст", image: UIImage(systemName: "character")) { [weak self] (shareText) in
            print(shareText)
            self?.changeTextSize(ChangeText.more)
        }
        
        let textReduction = CustomActivity(title: "Уменьшить текст", image: UIImage(systemName: "character")) { [weak self] (shareText) in
            print(shareText)
            self?.changeTextSize(ChangeText.less)
        }
        
        let shareController = UIActivityViewController(activityItems: item, applicationActivities: [textMagnification, textReduction])
        
        present(shareController, animated: true, completion: nil)
        
        shareController.excludedActivityTypes = [.postToFlickr, .postToVimeo, .saveToCameraRoll]
    }
    
    // MARK: - Animation
    
    @objc func animateButton() {
        shareButton.layer.removeAllAnimations()
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0.4
        animation.duration = 0.2
        
        shareButton.layer.add(animation, forKey: nil)
    }
}
