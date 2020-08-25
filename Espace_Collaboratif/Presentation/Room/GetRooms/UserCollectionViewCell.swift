//
//  UserCollectionViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/25/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblnmbruser: UILabel!
        @IBOutlet weak var UserImage: UIImageView!
        
        
        func configure(withIcon: String) {
               UserImage.layer.masksToBounds = false
               UserImage.layer.cornerRadius = 20
               UserImage.clipsToBounds = true
            UserImage.image = UIImage(named: withIcon)
        }
        override func awakeFromNib() {
            UserImage.layer.masksToBounds = false
                     UserImage.layer.cornerRadius = 20
                     UserImage.clipsToBounds = true
            
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()    
           }
    
        
        
        
    }


