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
        AF.request(SelectAllUserURL).responseJSON{
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
    
    
    func getUserLogged(completion: @escaping (User1) -> Void) {
        
        let headers: HTTPHeaders = [
        "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIzbHBJSFp0NzFEQXZ5ZmZYZ1habUhPZ1o3ZnpaaTB6SUR0dDNxS0ZXVF80In0.eyJqdGkiOiIxOWE0NzQxMy1iMWEwLTQzMmMtOTNhYS1jMDY4NWViNTQwMWMiLCJleHAiOjE1ODYyOTAzMDAsIm5iZiI6MCwiaWF0IjoxNTg2MjcyMzAwLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODAvYXV0aC9yZWFsbXMvZXNwYWNlX2NvbGxhYm9yYXRpdmUiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiM2Q0OTVjZTgtMmE2NC00YjgwLWFkYjUtZjAyOTY0ZjRhZDI5IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoicXVhcmt1cy1hcHAiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJjYmIxZWM2MC0yNDdjLTRiZDktOWYyZi05ODVkZTg4NmRhZGIiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHA6Ly9sb2NhbGhvc3Q6ODA4OS8iXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIlJPTEVfVVNFUiIsIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicHJlZmVycmVkX3VzZXJuYW1lIjoibWVoZGkifQ.bLDcNJzlWSE3lIIMmavRBj_GVS8aWPteUabgvKhg9mOP5QHQivWo2B1I4Zp_hs1JX28jewFUTP_1P1v_rkNgSy660-OXZm9Kc9d1bnaesI2kf0ddUimBCK_ZaBXc2ULMQxR_nhiDPuXavqxN08yxrBf-N4R20WF10PmnYt2V322QPNrkL-4e0EOn9iAfL18mvnpk6ItibgObi_l5V5F9VXDgYgw7lJEECk0rUZ-caC_jRm8pl2PTajP2UJ0xhsvERmsyX02n8-MAN7LBjl045kK1dy50DYnGk2rAcu-dyjEUUanRBvFCVgNmCmzMzvEiNhUhe_efe_A6aIIRFwvqYQ",
               "Accept": "application/json"
           ]
        AF.request(loggedUser,method: .get, headers: headers).responseJSON{
                         response in

            // print (response)
            let userloggedarray = (response.value as! NSObject)
                  var userlogged: User1!
                  do{
                      userlogged = try JSONDecoder().decode(User1.self, from: try! JSONSerialization.data(withJSONObject: userloggedarray))
                  // print(userlogged)
                  } catch let error as NSError {
                      print("Failed to load: \(error.description)")
                  }
                  completion(userlogged)
              }
       
       }
    
    
    
}
