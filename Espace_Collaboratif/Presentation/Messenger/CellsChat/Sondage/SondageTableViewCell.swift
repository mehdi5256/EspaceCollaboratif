//
//  SondageTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 7/3/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
protocol SondageDelegate {
    func SondageVote(tag: Int)
   // func ReactionPost(tag: Int)

}

class SondageTableViewCell: UITableViewCell {

    @IBOutlet weak var voterBtn: UIButton!
    @IBOutlet weak var cvvvv: UICollectionView!
    @IBOutlet weak var questionsondage: UILabel!
    var delegate: SondageDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
       self.cvvvv.reloadData()
         }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @IBAction func SondageVote(_ sender: UIButton) {
           delegate?.SondageVote(tag:sender.tag)

       }

}
