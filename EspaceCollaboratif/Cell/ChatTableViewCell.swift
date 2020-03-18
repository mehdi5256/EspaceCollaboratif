//
//  ChatTableViewCell.swift
//  chatui
//
//  Created by mehdi drira on 3/10/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    @IBOutlet weak var viewimguser: UIView!
    @IBOutlet weak var imguser: UIImageView!
    
    @IBOutlet weak var aaaaa: UITextView!
    @IBOutlet weak var viewmsg: UIView!
  //  @IBOutlet weak var viewlblnomuser: UIView!
    @IBOutlet weak var userlablbubble: UILabel!
    @IBOutlet weak var viewright: UIView!
    @IBOutlet weak var viewleftuser: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        viewmsg.layer.cornerRadius = 10
        
        
        viewimguser.layer.masksToBounds = false
               viewimguser.layer.cornerRadius = viewimguser.frame.height/2
               viewimguser.clipsToBounds = true
        
        
        imguser.layer.masksToBounds = false
        imguser.layer.cornerRadius = imguser.frame.height/2

        imguser.clipsToBounds = true
        
        
        
        
    viewright.roundCorners([.topRight, .topRight] , radius: 10)
    //viewleftuser.roundCorners([.topLeft, .topLeft] , radius: 1)



        // Configure the view for the selected state
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

