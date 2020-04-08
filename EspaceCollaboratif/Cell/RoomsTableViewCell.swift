//
//  RoomsTableViewCell.swift
//  ncnhlhjitsi
//
//  Created by mehdi drira on 3/9/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var RoomName: UILabel!
    @IBOutlet weak var viewcell: UIView!
    
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var NumPoste: UILabel!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = viewcell.bounds

    }
    
     override func prepareForReuse() {
          
             viewcell.backgroundColor = nil
               NumPoste?.text = ""
             UserName?.text = ""
         }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   func configure(title: String) {
           //img.image = UIImage(named: withIcon)
           RoomName.text = title
        


       }
    
    

    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {

        viewcell.layer.masksToBounds = true
        viewcell.layer.cornerRadius = 12
      clipsToBounds = false
             let gradientLayer = CAGradientLayer()
             gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
             gradientLayer.frame = viewcell.bounds

             gradientLayer.startPoint = CGPoint(x: 0, y: 0)
             gradientLayer.endPoint = CGPoint(x: 0, y: 1)
             viewcell.layer.insertSublayer(gradientLayer, at: 0)
           
        }
    
}
