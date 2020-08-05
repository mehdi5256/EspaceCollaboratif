//
//  VoteTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 7/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class VoteTableViewCell: UITableViewCell {

    @IBOutlet weak var checkedimg: UIButton!
    @IBOutlet weak var choixlbl: UILabel!
    @IBOutlet weak var shadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization cod
       // shadowView.addShadowView()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
      
    
}
extension UIView{
    
    func addShadowView(width:CGFloat=0, height:CGFloat=1, Opacidade:Float=0.13, maskToBounds:Bool=false, radius:CGFloat=8){
         self.layer.shadowColor = UIColor.black.cgColor
         self.layer.shadowOffset = CGSize(width: width, height: height)
         self.layer.cornerRadius = radius
         self.layer.shadowRadius = radius
         self.layer.shadowOpacity = Opacidade
         self.layer.masksToBounds = maskToBounds
    }
    
}
