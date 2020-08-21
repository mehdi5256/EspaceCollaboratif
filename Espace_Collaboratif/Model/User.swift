//
//  User.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

public struct User: Codable{
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var image: String
   // var rooms: Array<String>
    var  username :  String
    var badge : Badge?  
   
    
}
