//
//  FoodListNetworkManager.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation

enum NetworkError: Error {
    case someThingWentWrong
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .someThingWentWrong:
            return NSLocalizedString("Some thing went wrong", comment: "")
        }
    }
    
}

struct FoodListNetworkManager {
        
    static func fetchFoodList(url: URL, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
                completion(.failure(error))
            } else if let data = data {
                // Handle HTTP request response
                
                do {
                    let foodListBaseModel = try JSONDecoder().decode(FoodListBaseModel.self, from: data)
                    
                    completion(.success(foodListBaseModel.categories))
                } catch {
                    completion(.failure(error))
                }
            } else {
                // Handle unexpected error
                completion(.failure(NetworkError.someThingWentWrong))
            }
        }
        task.resume()
    }
    
}
