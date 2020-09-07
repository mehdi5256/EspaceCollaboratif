//
//  RoomsTableViewCell.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/25/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var RoomName: UILabel!
    @IBOutlet weak var viewcell: UIView!
    
    @IBOutlet weak var iconpriv: UIImageView!
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = viewcell.bounds
      //  self.setGradientBackground(colorOne: .green, colorTwo: .blue)
        
        viewcell.backgroundColor = .white


        viewcell.layer.shadowColor = UIColor.gray.cgColor

        viewcell.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

        viewcell.layer.shadowRadius = 6.0

        viewcell.layer.shadowOpacity = 0.7


    }
    
     override func prepareForReuse() {
       self.cv.reloadData()
         }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {

        if let gradientLayer = viewcell.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        } else {
            let gradientLayer = CAGradientLayer()
            viewcell.layer.masksToBounds = true
            viewcell.layer.cornerRadius = 12
            gradientLayer.frame = viewcell.bounds
            gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
            viewcell.layer.insertSublayer(gradientLayer, at: 0)
        }

   }
    
    
    
}
