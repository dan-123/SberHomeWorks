//
//  NewsNetworkServiceProtocol.swift
//  lection 17
//
//  Created by Даниил Петров on 06.06.2021.
//

import Foundation

typealias GetNewsAPIResponse = Result<GetNewsResponce, NetworkServiceError>

protocol NewsNetworkServiceProtocol {
    func getNews(completion: @escaping (GetNewsAPIResponse) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}
