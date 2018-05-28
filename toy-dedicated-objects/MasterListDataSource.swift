//
//  MasterListDataSource.swift
//  toy-dedicated-objects
//
//  Created by Faiz Mokhtar on 28/05/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import UIKit

class MasterListDataSource: NSObject {
    let products: [Product]

    init(products: [Product]) {
        self.products = products
    }

    func product(at indexPath: IndexPath) -> Product {
        return self.products[indexPath.row]
    }
}

extension MasterListDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: product(at: indexPath))
    }

    func cell(for product: Product) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = product.name
        return cell
    }
}
