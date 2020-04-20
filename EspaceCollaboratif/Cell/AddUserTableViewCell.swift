//
//  AddUserTableViewCell.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 3/20/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class AddUserTableViewCell: UITableViewCell {

  //  @IBOutlet weak var checkuser: UIImageView!
    @IBOutlet weak var imguser: UIImageView!
    @IBOutlet weak var usernom: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     //   checkuser.image = UIImage(named: "circle")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }

}
