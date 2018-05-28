//
//  MasterViewController.swift
//  toy-dedicated-objects
//
//  Created by Faiz Mokhtar on 28/05/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var currentDataSource: UITableViewDataSource? {
        didSet {
            self.tableView.dataSource = currentDataSource
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var products: [Product] = []

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.products = loadProducts()
        self.currentDataSource = MasterSectionsDataSource(products: products)
    }

    func loadProducts() -> [Product] {
        let products: [Product] = [
            Product(name: "soap", category: "bodywash", price: 20.00),
            Product(name: "flower", category: "plant", price: 5.00),
            Product(name: "playstation 4", category: "electronic", price: 1000.00)
        ]
        return products
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.currentDataSource = MasterSectionsDataSource(products: self.products)
        case 1:
            self.currentDataSource = MasterListDataSource(products: self.products)
        default:
            break
        }
    }
}

