//
//  ViewController.swift
//  lection13
//
//  Created by Даниил Петров on 27.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(animateFlash), for: .touchUpInside)
        button.setTitle("Запустить анимацию", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 20
        button.backgroundColor = .yellow
        return button
    }()
    
    lazy var imageHelmetTop: UIView = {
        let image = UIImageView(image: UIImage(named: "helmetTop"))
        return image
    }()
    
    lazy var imageHelmetRight: UIView = {
        let image = UIImageView(image: UIImage(named: "helmetRight"))
        return image
    }()
    
    lazy var imageHelmetBottom: UIView = {
        let image = UIImageView(image: UIImage(named: "helmetBottom"))
        return image
    }()
    
    lazy var imageTheFlashTextShadow: UIView = {
        let image = UIImageView(image: UIImage(named: "theFlashTextShadow"))
        return image
    }()
    
    lazy var imageBottomRight: UIView = {
        let image = UIImageView(image: UIImage(named: "bottomRight"))
        return image
    }()
    
    lazy var imageBottomLeft: UIView = {
        let image = UIImageView(image: UIImage(named: "bottomLeft"))
        return image
    }()
    
    lazy var imageBottomCentre: UIView = {
        let image = UIImageView(image: UIImage(named: "bottomCentre"))
        return image
    }()
    
    lazy var imageDarkElementTop: UIView = {
        let image = UIImageView(image: UIImage(named: "darkElementTop"))
        return image
    }()
    
    lazy var imageDarkElementBottom: UIView = {
        let image = UIImageView(image: UIImage(named: "darkElementBottom"))
        return image
    }()
    
    lazy var imageYellowElementTop: UIView = {
        let image = UIImageView(image: UIImage(named: "yellowElementTop"))
        return image
    }()
    
    lazy var imageYellowElementBottom: UIView = {
        let image = UIImageView(image: UIImage(named: "yellowElementBottom"))
        return image
    }()
    
    lazy var imageShadow: UIView = {
        let image = UIImageView(image: UIImage(named: "shadow"))
        return image
    }()
    
    lazy var imageLightning: UIView = {
        let image = UIImageView(image: UIImage(named: "lightning"))
        return image
    }()
    
    lazy var imageFace: UIView = {
        let image = UIImageView(image: UIImage(named: "face"))
        return image
    }()
    
    lazy var imageTheFlashText: UIView = {
        let image = UIImageView(image: UIImage(named: "theFlashText"))
        return image
    }()
    
    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        setupImage()
        setupShareButton()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        drawImage()
    }
    
    // MARK: - Auto Layout
    
    func setupShareButton() {
        view.addSubview(startButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 64),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64)
        ])
    }
    
    // MARK: - Methods
    
    func setupImage() {
        view.addSubview(imageHelmetTop)
        view.addSubview(imageHelmetRight)
        view.addSubview(imageHelmetBottom)
        view.addSubview(imageTheFlashTextShadow)
        view.addSubview(imageBottomRight)
        view.addSubview(imageBottomLeft)
        view.addSubview(imageBottomCentre)
        view.addSubview(imageDarkElementTop)
        view.addSubview(imageDarkElementBottom)
        view.addSubview(imageYellowElementTop)
        view.addSubview(imageYellowElementBottom)
        view.addSubview(imageShadow)
        view.addSubview(imageLightning)
        view.addSubview(imageFace)
        view.addSubview(imageTheFlashText)
    }
    
    func drawImage() {
        imageHelmetTop.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageHelmetTop.center = view.center
        
        imageHelmetRight.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageHelmetRight.center = view.center
        
        imageHelmetBottom.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageHelmetBottom.center = view.center
        
        imageTheFlashTextShadow.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageTheFlashTextShadow.center = view.center
        
        imageBottomRight.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageBottomRight.center = view.center
        
        imageBottomLeft.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageBottomLeft.center = view.center
        
        imageBottomCentre.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageBottomCentre.center = view.center
        
        imageDarkElementTop.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageDarkElementTop.center = view.center
        
        imageDarkElementBottom.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageDarkElementBottom.center = view.center
        
        imageYellowElementTop.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageYellowElementTop.center = view.center
        
        imageYellowElementBottom.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageYellowElementBottom.center = view.center
        
        imageShadow.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageShadow.center = view.center
        
        imageLightning.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageLightning.center = view.center
        
        imageFace.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageFace.center = view.center
        
        imageTheFlashText.frame = .init(x: 0, y: 0, width: 500, height: 500)
        imageTheFlashText.center = view.center
    }
    
    // MARK: - Animation
    
    @objc func animateFlash() {
       
        var startAnimation: Double
        var elementDuration: Double
        var timeToNext: Double
        
        let posX = view.frame.width
        let posY = view.frame.height
        
        //анимация шлема
        elementDuration = 0.5
        animationPosition(image: imageHelmetTop as! UIImageView, fromValue: [0, 0], duration: elementDuration)
        animationPosition(image: imageHelmetRight as! UIImageView, fromValue: [posX, posY/3], duration: elementDuration)
        timeToNext = animationPosition(image: imageHelmetBottom as! UIImageView, fromValue: [posX/2, posY], duration: elementDuration)
        
        // анимация тени надписи
        elementDuration = 0.25
        animationOpacity(image: imageTheFlashTextShadow as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: timeToNext, secondFromValue: 0, secondToValue: 1, secondDuration: elementDuration)
        
        // анимация левого и правого нижних элемента
        elementDuration = 0.5
        startAnimation = timeToNext / 2
        animationOpacityAndPosition(image: imageBottomLeft as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: [0, posY], secondDuration: elementDuration)
        animationOpacityAndPosition(image: imageBottomRight as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: [posX, 0], secondDuration: elementDuration)
        
        // анимация центрального нижнего элемента
        elementDuration = 0.5
        startAnimation = timeToNext + 0.25
        animationOpacity(image: imageBottomCentre as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: 0, secondToValue: 1, secondDuration: elementDuration)
        
        // анимация темных элементов
        elementDuration = 0.5
        startAnimation = timeToNext
        animationOpacityAndPosition(image: imageDarkElementTop as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: [posX, posY], secondDuration: elementDuration)
        animationOpacityAndPosition(image: imageDarkElementBottom as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: [0, posY], secondDuration: elementDuration)
        
        // анимация верхнего желтого элементов
        elementDuration = 0.5
        startAnimation = timeToNext
        animationOpacityAndPosition(image: imageYellowElementTop as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: [posX, posY/4], secondDuration: elementDuration)
        
        // анимация нижнего желтого элементов
        elementDuration = 0.5
        startAnimation = timeToNext + 0.25
        timeToNext = animationOpacity(image: imageYellowElementBottom as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: 0, secondToValue: 1, secondDuration: elementDuration)
        
        // анимация тени
        elementDuration = 0.5
        startAnimation = timeToNext
        timeToNext = animationOpacity(image: imageShadow as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: 0, secondToValue: 1, secondDuration: elementDuration)
        
        // анимация молнии
        elementDuration = 0.5
        startAnimation = timeToNext
        timeToNext = animationOpacity(image: imageLightning as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: 0, secondToValue: 1, secondDuration: elementDuration)
        
        // анимация лица
        elementDuration = 1
        startAnimation = timeToNext
        timeToNext = animationOpacity(image: imageFace as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: 0, secondToValue: 1, secondDuration: 1)
        
        // анимация надписи
        elementDuration = 0.5
        startAnimation = timeToNext - 0.5
        animationOpacity(image: imageTheFlashText as! UIImageView, firstFromValue: 0, firstToValue: 0, startAnimation: startAnimation, secondFromValue: 0, secondToValue: 1, secondDuration: elementDuration)
    }
    
    // MARK: - position animation
    
    @discardableResult
    @objc func animationPosition(image: UIImageView, fromValue: [CGFloat], duration: Double) -> Double {
        
        image.layer.removeAllAnimations()
        
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.fromValue = fromValue
        animation.toValue = [view.frame.width/2, view.frame.height/2]
        animation.duration = duration
        
        image.layer.add(animation, forKey: nil)
        
        return animation.duration
    }
    
    // MARK: - opacity animation
    
    @discardableResult
    @objc func animationOpacity(image: UIImageView, firstFromValue: Double, firstToValue: Double, startAnimation: Double, secondFromValue: Double, secondToValue: Double, secondDuration: Double) -> Double {
        
        image.layer.removeAllAnimations()

        let firstAnimation = CABasicAnimation(keyPath: "opacity")
        let secondAnimation = CABasicAnimation(keyPath: "opacity")
        
        firstAnimation.fromValue = firstFromValue
        firstAnimation.toValue = firstToValue
        firstAnimation.duration = startAnimation
        
        secondAnimation.fromValue = secondFromValue
        secondAnimation.toValue = secondToValue
        secondAnimation.duration = secondDuration
        secondAnimation.beginTime = CACurrentMediaTime() + startAnimation
        
        image.layer.add(firstAnimation, forKey: nil)
        image.layer.add(secondAnimation, forKey: nil)
        
        return firstAnimation.duration + secondAnimation.duration
    }
    
    // MARK: - position and opacity animation
    
    @discardableResult
    @objc func animationOpacityAndPosition(image: UIImageView, firstFromValue: Double, firstToValue: Double, startAnimation: Double, secondFromValue: [CGFloat], secondDuration: Double) -> Double {
        
        image.layer.removeAllAnimations()
        
        let firstAnimation = CABasicAnimation(keyPath: "opacity")
        let secondAnimation = CABasicAnimation(keyPath: "position")
        
        firstAnimation.fromValue = firstFromValue
        firstAnimation.toValue = firstToValue
        firstAnimation.duration = startAnimation
        
        secondAnimation.fromValue = secondFromValue
        secondAnimation.toValue = [view.frame.width/2, view.frame.height/2]
        secondAnimation.duration = secondDuration
        secondAnimation.beginTime = CACurrentMediaTime() + firstAnimation.duration
        
        image.layer.add(firstAnimation, forKey: nil)
        image.layer.add(secondAnimation, forKey: nil)
        
        return firstAnimation.duration + secondAnimation.duration
    }
}
