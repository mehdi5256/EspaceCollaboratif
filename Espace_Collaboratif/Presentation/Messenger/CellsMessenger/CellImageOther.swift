//
//  cellimageotherTableViewCell.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/15/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class CellImageOther: UITableViewCell {


    @IBOutlet weak var usernamelbl: UILabel!
    @IBOutlet weak var viewimg: UIView!
    @IBOutlet weak var timestamp: UILabel!

        @IBOutlet weak var imgsend: UIImageView!
        @IBOutlet weak var viewsendimg: UIView!
       
        @IBOutlet weak var viewleft: UIView!
        @IBOutlet weak var viewright: UIView!
        @IBOutlet weak var msgtxt: UITextView!
        @IBOutlet weak var message: UIStackView!
        @IBOutlet weak var imguser: UIImageView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

       viewsendimg.layer.cornerRadius = 10
        imgsend.layer.cornerRadius = 10

                    
                    
                    viewimg.layer.masksToBounds = false
                           viewimg.layer.cornerRadius = viewimg.frame.height/2
                           viewimg.clipsToBounds = true
                    
                    
                    imguser.layer.masksToBounds = false
                    imguser.layer.cornerRadius = imguser.frame.height/2

                    imguser.clipsToBounds = true
                    
                    
        //    viewright.roundCorners([.topLeft, .topLeft] , radius: 10)
                viewleft.roundCorners([.topRight, .topRight] , radius: 10)



                }
                
                

            }

   
