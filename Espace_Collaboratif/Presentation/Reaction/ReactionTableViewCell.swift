//
//  ReactionTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 6/2/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class ReactionTableViewCell: UITableViewCell {

    @IBOutlet weak var reactionicon: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
