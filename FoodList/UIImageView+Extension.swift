//
//  UIImageView+Extension.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func load(url: URL) {
        Task {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return
            }
            
            await MainActor.run {
                self.image = UIImage(data: data)
            }
        }
    }
    
}
