//
//  RoomService.swift
//  EspaceCollaboratif
//
//  Created by mehdi drira on 3/13/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
import Alamofire

class RoomService: NSObject{
    
    func getAll(completion: @escaping ([Room1]) -> Void) {
        AF.request("http://cf36a5d0.ngrok.io/room").responseJSON{
                   response in
                let tvShowsArray = (response.value as! NSArray)
            var rooms: [Room1] = []
            do{
                rooms = try JSONDecoder().decode([Room1].self, from: try! JSONSerialization.data(withJSONObject: tvShowsArray))
            } catch let error as NSError {
                print("Failed to load: \(error.description)")
            }
            completion(rooms)
        }
    }
}
