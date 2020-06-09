//
//  TextSenderCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

protocol ReactionDelegate {
    func didButtonPressedreaction(tag: Int)
}

class TextSenderCell: UITableViewCell {
   // let selectReaction    = ReactionSelector()

    
//    @IBOutlet weak var ReactionBtn: ReactionButton!{
//
//        didSet {
//            ReactionBtn.reactionSelector = selectReaction
//
//            ReactionBtn.config = ReactionButtonConfig() {
//                $0.font = UIFont(name: "HelveticaNeue", size: 0)
//                $0.neutralTintColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
//                $0.alignment = .centerRight
//
//
//            }
//
//        }
//    }
    @IBOutlet var messageBackground: UIView!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var messageContainer: UIView!
    @IBOutlet var receiverImage: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var receiverName: UILabel!
    @IBOutlet weak var ViewReaction: UIView!
    
    @IBOutlet weak var BtnReaction: UIButton!
    
    var delegate: ReactionDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    @IBAction func ReacSelecBtn(_ sender: Any) {
//        
//        ReactionBtn.reaction   = ReactionBtn.reaction
//              ReactionBtn.isSelected = true
//              print(selectReaction.selectedReaction!.title)
    }
    
    @IBAction func ReactionAction(_ sender: UIButton) {
        delegate?.didButtonPressedreaction(tag:sender.tag)

    }
}
