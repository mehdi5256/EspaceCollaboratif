//
//  Room.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

public struct Room1: Codable{
    var id: Int?
    var name: String?
    var image: String?
    var subject: String?
    var isPrivate: Bool?
    var user :User?
    var users: [User]
}
