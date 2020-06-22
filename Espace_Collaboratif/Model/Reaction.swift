//
//  Reaction.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/30/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

public struct Reaction: Codable{
    var id: Int?
    var type: String?
    var user: User
    var message: Messenger1?
}
