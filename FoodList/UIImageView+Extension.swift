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
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        
        task.resume()
    }
    
}
