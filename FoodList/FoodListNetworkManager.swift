//
//  FoodListNetworkManager.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation

enum NetworkError: Error {
    case invalidServerResponse
    case someThingWentWrong
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return NSLocalizedString("Invalid server response", comment: "")
        case .someThingWentWrong:
            return NSLocalizedString("Some thing went wrong", comment: "")
        }
    }
    
}

struct FoodListNetworkManager {
        
    static func fetchFoodList(url: URL) async throws -> [FoodModel] {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let foodListBaseModel = try JSONDecoder().decode(FoodListBaseModel.self, from: data)
        return foodListBaseModel.categories
    }
    
}
