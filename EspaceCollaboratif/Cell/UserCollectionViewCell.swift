//
//  UserCollectionViewCell.swift
//  ncnhlhjitsi
//
//  Created by mehdi drira on 3/9/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblnmbruser: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    
    
    func configure(withIcon: String) {
        //UserIcon.layer.borderWidth = 1
           UserImage.layer.masksToBounds = false
          // UserIcon.layer.borderColor = UIColor.black.cgColor
           UserImage.layer.cornerRadius = UserImage.frame.height/2
           UserImage.clipsToBounds = true
        UserImage.image = UIImage(named: withIcon)
    }
    override func awakeFromNib() {
        UserImage.layer.masksToBounds = false
                // UserIcon.layer.borderColor = UIColor.black.cgColor
                 UserImage.layer.cornerRadius = UserImage.frame.height/2
                 UserImage.clipsToBounds = true
        
    }
    
}
