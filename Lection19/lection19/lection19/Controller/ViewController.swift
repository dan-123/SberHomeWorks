//
//  ViewController.swift
//  lection19
//
//  Created by Даниил Петров on 17.06.2021.
//

import UIKit

class ViewController: UIViewController, FilterViewDelegate {
    
    // MARK: - Dependencies
    
    private let filterService: FilterService
    private var imageModel: ImageModel
    private var imageFilterModel: ImageFilterModel
    private var filterModel: FilterModel

    // MARK: - Properties
    
    lazy var choiseLabel: UILabel = {
        let choiseLabel = UILabel()
        
        choiseLabel.textAlignment = .center
        choiseLabel.numberOfLines = 0
        choiseLabel.font = UIFont.systemFont(ofSize: 22)
        choiseLabel.text = "Нажмите для выбора фото из галерии"
        choiseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return choiseLabel
    }()
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()

        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        return imagePicker
    }()
    
    lazy var settingView: SettingView = {
        let settingView = SettingView(frame: .zero)
        
        settingView.translatesAutoresizingMaskIntoConstraints = false
        
        return settingView
    }()
    
    lazy var filterSetting: FilterCollectionView = {
        let filterSetting = FilterCollectionView(frame: .zero)
        
        filterSetting.delegate = self
        filterSetting.translatesAutoresizingMaskIntoConstraints = false
        
        return filterSetting
    }()
    
    var selectedFilter: Int?
    
    // MARK: - Init

    init(filterService: FilterService, imageModel: ImageModel, imageFilterModel: ImageFilterModel, filterModel: FilterModel) {
        self.filterService = filterService
        self.imageModel = imageModel
        self.imageFilterModel = imageFilterModel
        self.filterModel = filterModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(choiseLabel)
        
        setupConstraint()
        setupSettingView()
        setupFilterSetting()
        setupNavigationTools()
        
        setupVisible(settingViewIsHidden: true, intensityIsHiden: true, filterSettingIsHidden: true, choiseLabelIsHidden: false, barButtonIsEnable: false)
        
        settingView.filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        settingView.slider.addTarget(self, action: #selector(sliderChange), for: .touchUpInside)
        settingView.saveButton.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
    }

    // MARK: - Methods
    
    private func setupNavigationTools() {
        self.title = "Редактирование фото"
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(settingButtonTapped))
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)

    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            choiseLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            choiseLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            choiseLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 36),
            choiseLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -36)
                ])
    }
    
    private func setupSettingView() {
        view.addSubview(settingView)
        
        NSLayoutConstraint.activate([
            settingView.topAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor, constant: 250),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            settingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
    }
    
    private func setupFilterSetting() {
        view.addSubview(filterSetting)
        
        NSLayoutConstraint.activate([
            filterSetting.topAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor, constant: 50),
            filterSetting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            filterSetting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            filterSetting.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    private func setupVisible(settingViewIsHidden: Bool, intensityIsHiden: Bool, filterSettingIsHidden: Bool, choiseLabelIsHidden: Bool, barButtonIsEnable: Bool) {
        settingView.isHidden = settingViewIsHidden
        settingView.intensityLabel.isHidden = settingViewIsHidden
        settingView.slider.isHidden = settingViewIsHidden
        settingView.intensityLabel.isHidden = intensityIsHiden
        settingView.slider.isHidden = intensityIsHiden
        
        filterSetting.isHidden = filterSettingIsHidden
        
        choiseLabel.isHidden = choiseLabelIsHidden
        navigationItem.rightBarButtonItem?.isEnabled = barButtonIsEnable
    }
    
    private func changeVisible() {
        settingView.isHidden.toggle()
        settingView.intensityLabel.isHidden.toggle()
        settingView.slider.isHidden.toggle()
        
        filterSetting.isHidden.toggle()
        
        choiseLabel.isHidden = true
        navigationItem.rightBarButtonItem?.isEnabled.toggle()
    }
    
    private func setupFilter(_ filterNumber: Int, _ intensity: Float) -> UIImage {
        let originalImage = imageModel.image
        if let filteredImage = filterService.setFilter(image: originalImage, filterName: filterModel.filterName[filterNumber], intensity: intensity) {
            return filteredImage
        }
        return originalImage
    }
    
    // MARK: - Action
    
    @objc func imageViewTapped() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func filterButtonTapped() {
        changeVisible()
        filterSetting.updateImage(imageFilterModel.filterImage)
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func didSelectFilter(index: Int) {
        selectedFilter = index
        imageView.image = setupFilter(index, 1)
        settingView.slider.value = 1
        setupVisible(settingViewIsHidden: true, intensityIsHiden: true, filterSettingIsHidden: false, choiseLabelIsHidden: true, barButtonIsEnable: true)
        navigationItem.title = filterModel.filterName[index]
    }
    
    @objc func sliderChange() {
        let intensity = settingView.slider.value
        guard let selectedFilter = selectedFilter else { return }
        imageView.image = setupFilter(selectedFilter, intensity)
    }
    
    @objc func settingButtonTapped() {
        changeVisible()
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc func saveImage() {
        guard let image = imageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Ошибка сохранения", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Сохранено", message: "Фото сохранено в вашей библиотеке.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}

// MARK: - Extension

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let imageFromGallery = info[.editedImage] as? UIImage else {return}
        imageModel.image = imageFromGallery
        imageView.image = imageFromGallery
        
        if imageFilterModel.filterImage.count > 0 {
            imageFilterModel.filterImage.removeAll()
        }
        
        for filterName in filterModel.filterName {
            guard let filteredImage = filterService.setFilter(image: imageFromGallery, filterName: filterName, intensity: 1) else { return }
            imageFilterModel.filterImage.append(filteredImage)
        }
        
        navigationItem.title = "Фильтр не выбран"
        setupVisible(settingViewIsHidden: false, intensityIsHiden: true, filterSettingIsHidden: true, choiseLabelIsHidden: true, barButtonIsEnable: false)
        
        dismiss(animated: true, completion: nil)
    }
}
