//
//  Messenger.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/30/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

struct Messenger1:Codable {
   
    
    
    var body:String?
    var file:String?
    var id: Int?
    var timestamp:Int?
    var type:String?
    var user: User
    var reactions :[Reaction]?
    var choix: [Choix]?

 
    
}

struct Messenger2:Codable {
   
    
    
    var body:String?
    var type:String?
    var user: User
    var choix: [Choi2]?
    var room : Room1

 
    
}
//
//var body:String?
//var file:String?
//var id: Int?
//var timestamp:String?
//
//var type:String
//var user: User1



//var body:String?
//   var file:String?
//   var id: Int?
//   var timestamp:String?
//   var usert:String?
//    var userimg:String?
//
//   var type:String
//   var user: User1?
