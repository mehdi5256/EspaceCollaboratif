//
//  roundcorners.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/13/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

public class roundcorners: UIView {

  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
