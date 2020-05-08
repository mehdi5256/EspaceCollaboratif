//
//  ImageSenderCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class ImageSenderCell: UITableViewCell {
    
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var messageContainer: UIView!
    @IBOutlet var receiverImage: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var receiverName: UILabel!
    @IBOutlet weak var imgChat: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
