//
//  TextReceiverCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import Alamofire
 
import Reactions

class TextReceiverCell: UITableViewCell {
     let selectReaction    = ReactionSelector()
    static var typereac: String?

    
   @IBOutlet weak var ReactionBtn: ReactionButton! {

        didSet {
            ReactionBtn.reactionSelector = selectReaction

            ReactionBtn.config = ReactionButtonConfig() {
                $0.font = UIFont(name: "HelveticaNeue", size: 0)
                $0.neutralTintColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                $0.alignment = .centerRight


            }

        }
    }
    @IBOutlet var messageTextView: UITextView!
          @IBOutlet var messageBackground: UIView!
          @IBOutlet var senderName: UILabel!
          @IBOutlet var senderPicture: UIImageView!
          @IBOutlet var messageContainer: UIView!
          @IBOutlet var timeLabel: UILabel!
    
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
    @IBAction func ReacSelecBtn(_ sender: UIButton) {
        TextReceiverCell.typereac = selectReaction.selectedReaction!.title

        

        ReactionBtn.reaction   = ReactionBtn.reaction
        
        ReactionBtn.isSelected = true
       // print(selectReaction.selectedReaction!.title)
        print(TextReceiverCell.typereac!)
        delegate?.ReactionPost(tag:sender.tag)


        
       


        
    }

    
    
    @IBAction func ReactionAction(_ sender: UIButton) {
    delegate?.didButtonPressedreaction(tag:sender.tag)

    }
}
