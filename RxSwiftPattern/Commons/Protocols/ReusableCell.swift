//
//  ReusableCell.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import UIKit

protocol ReusableCell: UITableViewCell {
        static var identifier: String { get }
    static var nib: UINib { get }
    static func register(with tableview: UITableView)
}

extension ReusableCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
   static var nib: UINib {
        UINib(nibName: self.identifier, bundle: .main)
    }
    
    static func register(with tableView: UITableView) {
        tableView.register(self.nib, forCellReuseIdentifier: self.identifier)
    }
    
    
}
