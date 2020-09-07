//
//  Tag.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/5/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

public struct RoomRequest1: Codable{
    var id: Int?
    var room: Room1
    var user: User
    var status: String?
    }

