//
//  FoodModel.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation

struct FoodListBaseModel: Codable {
    let categories: [FoodModel]
}

struct FoodModel: Codable {
    let id: String
    let category: String
    let thumbImageUrlString: String
    let categoryDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case category  = "strCategory"
        case thumbImageUrlString = "strCategoryThumb"
        case categoryDescription  = "strCategoryDescription"
    }
    
}

//struct Food {
//    let title: String
//}
