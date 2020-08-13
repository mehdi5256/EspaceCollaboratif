//
//  TagCollectionViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/5/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var RoundViewTag: UIView!
    @IBOutlet weak var labeltag: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        RoundViewTag.layer.masksToBounds = true
           RoundViewTag.layer.cornerRadius = 15

    

   
    
}
}
