//
//  ReplyTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/10/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {

    @IBOutlet weak var userimg: UIImageView!
    @IBOutlet weak var reponse: UILabel!
    @IBOutlet weak var username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
