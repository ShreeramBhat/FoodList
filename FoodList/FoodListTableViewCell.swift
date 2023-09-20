//
//  FoodListTableViewCell.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import UIKit

class FoodListTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: FoodModel) {
        if let url = URL(string: model.thumbImageUrlString) {
            self.foodImageView.load(url: url)
        }
        self.foodTitleLabel.text = model.category
        self.foodDescriptionLabel.text = model.categoryDescription
    }

}
