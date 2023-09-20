//
//  FoodListNetworkManager.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation

struct FoodListNetworkManager {
        
    static func fetchFoodList(url: URL, completion: @escaping ([FoodModel]?, String?) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
                completion(nil, error.localizedDescription)
            } else if let data = data {
                // Handle HTTP request response
                
                do {
                    let foodListBaseModel = try JSONDecoder().decode(FoodListBaseModel.self, from: data)
                    
                    completion(foodListBaseModel.categories, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
            } else {
                // Handle unexpected error
                
                completion(nil, "Something went wrong")
            }
        }
        task.resume()
    }
    
}
