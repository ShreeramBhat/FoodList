//
//  FoodListViewModel.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation

struct FoodListViewModel {
    
    static let foodListUrlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
    
    static func fetchFoodList(urlString: String, completion: @escaping ([FoodModel]?, String?) -> Void) {
        guard let foodListUrl = URL(string: urlString) else {
            DispatchQueue.main.async {
                completion(nil, "Invalid Url")
            }
            
            return
        }
        
        FoodListNetworkManager.fetchFoodList(url: foodListUrl) { foodList, error in
            DispatchQueue.main.async {
                completion(foodList, error)
            }
        }
    }
    
}
