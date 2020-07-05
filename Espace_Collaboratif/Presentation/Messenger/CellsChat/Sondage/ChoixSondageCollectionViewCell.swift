//
//  ChoixSondageCollectionViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 7/3/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import GTProgressBar

class ChoixSondageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewstatrep: GTProgressBar!
    @IBOutlet weak var choixlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
        viewstatrep.barBorderColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
    viewstatrep.barFillColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
    viewstatrep.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
    viewstatrep.barBorderWidth = 0
    viewstatrep.barFillInset = 0
    viewstatrep.labelTextColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
    viewstatrep.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    viewstatrep.font = UIFont.boldSystemFont(ofSize: 18)
    viewstatrep.labelPosition = GTProgressBarLabelPosition.right
    viewstatrep.barMaxHeight = 12
        viewstatrep.direction = GTProgressBarDirection.clockwise
    }
}
