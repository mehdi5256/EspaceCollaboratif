//
//  teestCollectionViewCell.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 3/25/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class teestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    
    override func awakeFromNib() {
           img.layer.masksToBounds = false
                    img.layer.cornerRadius = img.frame.height/2
                    img.clipsToBounds = true
           
       }
}
