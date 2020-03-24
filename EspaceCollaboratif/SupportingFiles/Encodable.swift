//
//  Codable.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 3/23/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation

extension Encodable { /// Encode into JSON and return `Data`
    func jsonData() throws -> Data { let encoder = JSONEncoder(); encoder.outputFormatting = .prettyPrinted; encoder.dateEncodingStrategy = .iso8601; return try encoder.encode(self) }
    
}
