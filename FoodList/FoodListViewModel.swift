//
//  FoodListViewModel.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation

enum UrlError: Error {
    case invalidUrl
}

extension UrlError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return NSLocalizedString("Invalid url", comment: "")
        }
    }
    
}

struct FoodListViewModel {
    
    static let foodListUrlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
    
    static func fetchFoodList(urlString: String) async throws -> [FoodModel] {
        guard let foodListUrl = URL(string: urlString) else {
            throw UrlError.invalidUrl
        }
        
        return try await FoodListNetworkManager.fetchFoodList(url: foodListUrl)
    }
    
}
