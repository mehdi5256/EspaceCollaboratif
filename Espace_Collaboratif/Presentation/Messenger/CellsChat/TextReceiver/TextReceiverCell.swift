//
//  TextReceiverCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/8/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import Alamofire

class TextReceiverCell: UITableViewCell {
//    let selectReaction    = ReactionSelector()
    
//   @IBOutlet weak var ReactionBtn: ReactionButton! {
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
    @IBAction func ReacSelecBtn(_ sender: Any) {
//        ReactionBtn.reaction   = ReactionBtn.reaction
//        ReactionBtn.isSelected = true
//        print(selectReaction.selectedReaction!.title)
        
//        let myUrl = "http://8afc405d90aa.ngrok.io/reaction";
//
//        //  let type = "BRAVO";
//        //let description = Subject.text;
//
//
//
//        let parameters: [String: Any] = [
//            "type":"LIKE",
//            "user":
//                [
//                    "id":"32e1c468-d045-4e41-800f-32770db64cec",
//
//            ],
//            "message":
//                [
//                    "id":"446",
//
//            ],
//
//        ]
//
//        AF.request(myUrl, method: .post, parameters: parameters,encoding: JSONEncoding.init())
//            .responseJSON { response in
//                print(response.request)
//                print(response.response)
//                print(response.result)
//
//        }
//
//
        
    }

    
    
    @IBAction func ReactionAction(_ sender: UIButton) {
    delegate?.didButtonPressedreaction(tag:sender.tag)

    }
}
