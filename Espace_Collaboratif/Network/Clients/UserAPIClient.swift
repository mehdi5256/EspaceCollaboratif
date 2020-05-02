//
//  UserAPIClient.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/25/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Promises
import Alamofire

class UserAPIClient: APIClient {
   
     static func me(token: String) -> Promise<User> {
        return performRequest(route: UserConnectedEndPoints.me(token: token))
     }
        
        
      }

