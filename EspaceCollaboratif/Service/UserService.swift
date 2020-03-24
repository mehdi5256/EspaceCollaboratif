//
//  UserService.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 3/20/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
import Alamofire

class UserService: NSObject{
    
    func getAllUsers(completion: @escaping ([User1]) -> Void) {
        AF.request("http://cf36a5d0.ngrok.io/user").responseJSON{
                   response in
                let usersarray = (response.value as! NSArray)
            var users: [User1] = []
            do{
                users = try JSONDecoder().decode([User1].self, from: try! JSONSerialization.data(withJSONObject: usersarray))
            } catch let error as NSError {
                print("Failed to load: \(error.description)")
            }
            completion(users)
        }
    }
}
