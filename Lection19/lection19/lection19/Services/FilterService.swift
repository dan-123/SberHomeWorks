//
//  FilterService.swift
//  lection19
//
//  Created by Даниил Петров on 18.06.2021.
//

import UIKit

protocol FilterServiceProtocol {
    func setFilter(image: UIImage, filterName: String, intensity: Float) -> UIImage?
}

final class FilterService: FilterServiceProtocol {
    
    private let context = CIContext(options: nil)
    
    func setFilter(image: UIImage, filterName: String, intensity: Float) -> UIImage? {
        if let filter = CIFilter(name: filterName) {
            let beginImage = CIImage(image: image)
            
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            filter.setValue(intensity, forKey: kCIInputIntensityKey)
            
            if let outputImage = filter.outputImage {
                if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                    let filteredImage = UIImage(cgImage: cgImage)
                    return filteredImage
                }
            }
        }
        return image
    }
}
