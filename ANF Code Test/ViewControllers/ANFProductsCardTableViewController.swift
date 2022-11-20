//
//  ANFProductsCardTableViewController.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/20/22.
//

import Foundation
import UIKit

class ANFProductsCardTableViewController : UITableViewController, ANFIdentifiable {
    
    var products = [ANFProductItem]()
    var productProvider = ANFProductProviderService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        self.productProvider.getProductData() { [weak self] products in
            guard let self = self else {
                return
            }
            self.products = products
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ANFProductItemCell.Identifier) as? ANFProductItemCell else { return UITableViewCell() }
        let product = products[indexPath.row]
        cell.configure(product) {
            self.tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let product = self.products[indexPath.row]
        return ANFProductCellHeightCalculator.GetHeightForTableViewCell(tableView, with: product, for: indexPath)
    }
}
