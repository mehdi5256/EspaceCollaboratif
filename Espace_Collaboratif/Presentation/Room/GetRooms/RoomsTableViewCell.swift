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
    
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var NumPoste: UILabel!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = viewcell.bounds
      //  self.setGradientBackground(colorOne: .green, colorTwo: .blue)


    }
    
     override func prepareForReuse() {
       self.cv.reloadData()
         }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  func loadData(room: Room1){
    self.RoomName.text = room.name
    self.NumPoste.text = room.id?.description
    self.UserName.text = room.subject
    self.selectionStyle = .none


    

     }
    func config(){
    
        cv.reloadData()

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
