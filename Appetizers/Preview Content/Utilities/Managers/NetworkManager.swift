//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Rahul on 11/07/25.
//

import SwiftUI



final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://raw.githubusercontent.com/dada4747/Employee-PayRoll-Service/refs/heads/master/"
    
    private let appetizerURL = baseURL + "appetizer.json"
    
    private init() {}
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        
//        guard let url = URL(string: appetizerURL) else{
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { /*[weak self]*/ data, response, error in
//            
//            if let _ = error  {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalideData))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.unableToDecode))
//            }
//        }
//        task.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer]  {
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
            
        } catch {
            throw APError.invalideData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cachekey = NSString(string: urlString)
        if let image = cache.object(forKey: cachekey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cachekey)
            completed(image)
            
        }
        task.resume()
    }
}

