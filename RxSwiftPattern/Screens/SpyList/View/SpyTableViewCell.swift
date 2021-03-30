//
//  SpyTableViewCell.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/29/21.
//

import UIKit

class SpyTableViewCell: UITableViewCell, ReusableCell {   
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: SpyModel) {
        self.nameLabel.text = model.name
        self.ageLabel.text = "\(model.age)"
        
    }
    
}

extension SpyTableViewCell {
    
    static func dequeue(from tableView: UITableView, for indexPath: IndexPath, with model: SpyModel) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? SpyTableViewCell else {
            fatalError("Unable to deque TableViewCell with identifier \(self.identifier)")
        }
        cell.configure(model: model)
        return cell
    }
}
