//
//  SpyListViewController.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import UIKit

class SpyListViewController: UIViewController, ReusableController {
    
    typealias ObjectController = SpyListViewController
    @IBOutlet private weak var tableView: UITableView!
    private var spyListViewModel = SpyListViewModel(service: Service())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SpyTableViewCell.register(with: self.tableView)
        self.spyListViewModel.fetchJson()
    }
}

extension SpyListViewController: UITableViewDelegate {
    
}

extension SpyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.spyListViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let spyModel = self.spyListViewModel.cell(at: indexPath.row)
        return SpyTableViewCell.dequeue(from: tableView, for: indexPath, with: spyModel)
    }
}
