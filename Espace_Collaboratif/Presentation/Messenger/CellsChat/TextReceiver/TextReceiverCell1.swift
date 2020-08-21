//
//  TextReceiverCell1.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/17/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import Reactions


class TextReceiverCell1: UITableViewCell {
    
    let selectReaction    = ReactionSelector()
     static var typereac: String?
    @IBOutlet weak var heightReaction: NSLayoutConstraint!
    
    @IBOutlet weak var ReactionSummary: ReactionSummary!{
         didSet {
           
         //  ReactionSummary.reactions = [Reaction.facebook.sad,Reaction.facebook.like,Reaction.facebook.angry]
           
           ReactionSummary.setDefaultText(withTotalNumberOfPeople: 4, includingYou: true)
           ReactionSummary.config    = ReactionSummaryConfig {
             $0.spacing      = 4
             $0.iconMarging  = 0
             $0.font         = UIFont(name: "HelveticaNeue", size: 12)
             $0.textColor    = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
             $0.alignment    = .left
             $0.isAggregated = true
           // ReactionSummary.text      = "16"

           }
         }
       }
      override func prepareForReuse() {
           super.prepareForReuse()
        img.image = nil
           // Clear all content based views and their actions here
       }
     
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

    @IBOutlet weak var txt: UITextView!
       @IBOutlet weak var timstamp: UILabel!
       @IBOutlet weak var img: UIImageView!
    
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

    

