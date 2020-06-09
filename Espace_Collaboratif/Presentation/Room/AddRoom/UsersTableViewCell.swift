//
//  UsersTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/30/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imguser: UIImageView!
    @IBOutlet weak var usernom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
