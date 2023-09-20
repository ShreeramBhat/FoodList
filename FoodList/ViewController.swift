//
//  ViewController.swift
//  FoodList
//
//  Created by Shreeram Bhat on 20/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var foodListTableView: UITableView!
    
    private var foodList = [FoodModel]()
    
    private var closure: (() -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Categories"
        self.getFoodList()
        
//        self.closure = { // [weak self] in
//            
//        }
    }

    private func getFoodList() {
        if let foodListUrl = URL(string: FoodListViewModel.foodListUrlString) {
            FoodListViewModel.fetchFoodList(urlString: FoodListViewModel.foodListUrlString) { foodList, error in
                if let error = error {
                    let alert = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    return
                }
                
                if let foodList = foodList {
                    self.foodList = foodList
                    
                    self.foodListTableView.reloadData()
                }
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FoodListTableViewCell.self), for: indexPath) as! FoodListTableViewCell
        let model = self.foodList[indexPath.row]
        cell.configureCell(model: model)
        
        return cell
    }
    
}

