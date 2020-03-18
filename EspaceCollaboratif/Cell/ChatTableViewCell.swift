//
//  ChatTableViewCell.swift
//  chatui
//
//  Created by mehdi drira on 3/10/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
     @IBOutlet weak var viewleft: UIView!
        @IBOutlet weak var viewright: UIView!
        @IBOutlet weak var msgtxt: UITextView!
        @IBOutlet weak var message: UIStackView!
        @IBOutlet weak var imguser: UIImageView!
        @IBOutlet weak var viewimg: UIView!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

       msgtxt.layer.cornerRadius = 10
                    
                    
                    viewimg.layer.masksToBounds = false
                           viewimg.layer.cornerRadius = viewimg.frame.height/2
                           viewimg.clipsToBounds = true
                    
                    
                    imguser.layer.masksToBounds = false
                    imguser.layer.cornerRadius = imguser.frame.height/2

                    imguser.clipsToBounds = true
                    
                    

                viewleft.roundCorners([.topRight, .topRight] , radius: 10)



                }
                
                

            }

    extension UIView {

        func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
             let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
             let mask = CAShapeLayer()
             mask.path = path.cgPath
             self.layer.mask = mask
        }

    }

