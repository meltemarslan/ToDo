//
//  TableViewCell.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import UIKit

class TableViewHucre: UITableViewCell {

    @IBOutlet weak var toDoBilgiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
