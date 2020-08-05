//
//  Topic1.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/5/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

public struct Topic1: Codable{
    var id: Int?
    var title: String?
    var description: String?
    var timestamp: Int?
    var seen: Int?
    var status: String?
    var user: User
    var tags: [Tag]
    var countReplies: Int?

}
