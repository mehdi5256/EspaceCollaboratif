//
//  RoomRequestTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 9/6/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

protocol RoomRequestDelegate:class {
    func didButtonPressedRoomRequest(tag: Int)
    func rejectDemande(tag:Int)

}

class RoomRequestTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
      
        ViewGlobal.backgroundColor = .white


        ViewGlobal.layer.shadowColor = UIColor.gray.cgColor

        ViewGlobal.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

        ViewGlobal.layer.shadowRadius = 6.0

        ViewGlobal.layer.shadowOpacity = 0.7

    }


    @IBOutlet weak var username2: UILabel!
    @IBOutlet weak var WhiteView: UIView!
    @IBOutlet weak var GroupeName: UILabel!
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var BlueView: UIView!
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var Accept: UIButton!
    @IBOutlet weak var Refus: UIButton!
    @IBOutlet weak var ViewGlobal: UIView!
    weak var delegate: RoomRequestDelegate?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func BtnRéfuserAction(_ sender: UIButton) {
        
        delegate?.rejectDemande(tag:sender.tag)

    }
    @IBAction func BtnAcceptAction(_ sender: UIButton) {
        
        delegate?.didButtonPressedRoomRequest(tag:sender.tag)

    }
}
