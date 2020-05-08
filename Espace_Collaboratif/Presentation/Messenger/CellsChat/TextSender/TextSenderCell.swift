//
//  TextSenderCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class TextSenderCell: UITableViewCell {
    
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var messageContainer: UIView!
    @IBOutlet var receiverImage: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var receiverName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
