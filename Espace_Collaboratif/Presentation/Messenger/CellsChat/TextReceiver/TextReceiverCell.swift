//
//  TextReceiverCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class TextReceiverCell: UITableViewCell {
    @IBOutlet var messageTextView: UITextView!
          @IBOutlet var messageBackground: UIView!
          @IBOutlet var senderName: UILabel!
          @IBOutlet var senderPicture: UIImageView!
          @IBOutlet var messageContainer: UIView!
          @IBOutlet var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
