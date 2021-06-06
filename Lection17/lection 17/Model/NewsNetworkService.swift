//
//  NewsNetworkService.swift
//  lection 17
//
//  Created by Даниил Петров on 06.06.2021.
//

import Foundation

final class NewsNetworkService {
    
    private let session: URLSession = .shared
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }() 
}

extension NewsNetworkService: NewsNetworkServiceProtocol {
    
    func getNews(completion: @escaping (GetNewsAPIResponse) -> Void) {
        var components = URLComponents(string: Constants.NewsAPIMethods.getNews)
        
        components?.queryItems = [
            URLQueryItem(name: "country", value: Constants.NewsKey.country),
            URLQueryItem(name: "apiKey", value: Constants.NewsKey.apiKey)
        ]
        
        guard let url = components?.url else {
            completion(.failure(.unknown))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { rawData, responce, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: responce)
                let responce = try self.decoder.decode(GetNewsResponce.self, from: data)
                completion(.success(responce))
            } catch let error as NetworkServiceError {
                completion(.failure(error))
            } catch {
                completion(.failure(.unknown))
            }
        }.resume()
    }
    
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: imageUrl) else {
            completion(nil)
            return
            
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        
        session.dataTask(with: request) { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                completion(data)
            } catch {
                completion(nil)
            }
        }.resume()
    }
    
    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw NetworkServiceError.network
        }
        return data
    }
}
