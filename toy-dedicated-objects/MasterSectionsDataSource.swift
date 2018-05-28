//
//  MasterSectionsDataSource.swift
//  toy-dedicated-objects
//
//  Created by Faiz Mokhtar on 28/05/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import UIKit

class MasterSectionsDataSource: NSObject {
    struct Section {
        let title: String
        let items: [Product]
    }
    let sections: [Section]

    init(products: [Product]) {
        let groups = Dictionary(grouping: products, by: { product in product.category })
        self.sections = groups.map(Section.init).sorted(by: { $0.title < $1.title })
    }

    func product(at indexPath: IndexPath) -> Product {
        return self.sections[indexPath.section].items[indexPath.row]
    }
}

extension MasterSectionsDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
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
