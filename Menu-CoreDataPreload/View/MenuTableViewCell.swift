//
//  MenuTableViewCell.swift
//  Menu-CoreDataPreload
//
//  Created by Terry Jason on 2024/1/12.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
