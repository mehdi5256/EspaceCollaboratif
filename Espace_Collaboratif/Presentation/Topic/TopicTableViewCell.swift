//
//  TopicTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/4/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleTopic: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var DescriptionTopic: UILabel!
    @IBOutlet weak var CountReply: UILabel!
    @IBOutlet weak var TagName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
