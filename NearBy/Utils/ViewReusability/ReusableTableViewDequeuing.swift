//
//  ReusableTableViewDequeuing.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit


extension UITableView {
    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        self.register(Cell.self, forCellReuseIdentifier: Cell.reuseId)
    }
    
    func dequeueCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell
        else {
            fatalError("Failed to dequeue cell with reuseIdentifier: \(Cell.reuseId)")
        }
        
        return cell
    }
}
