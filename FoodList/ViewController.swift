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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Categories"
        self.getFoodList()
    }

    private func getFoodList() {
        Task {
            do { 
               let foodList = try await FoodListViewModel.fetchFoodList(urlString: FoodListViewModel.foodListUrlString)
                self.foodList = foodList
                
                await MainActor.run {
                    self.foodListTableView.reloadData()
                }
            } catch {
                await MainActor.run {
                    let alert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
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

