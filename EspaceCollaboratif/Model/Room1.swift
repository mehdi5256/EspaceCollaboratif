//
//  Room1.swift
//  EspaceCollaboratif
//
//  Created by mehdi drira on 3/13/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation

struct Room1: Codable{
    var id: Int?
    var name: String?
    var image: String?
    var subject: String
    var users: [User1]
}
