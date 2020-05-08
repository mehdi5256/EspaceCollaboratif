//
//  RoomAPIClient.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Promises

class RoomAPIClient: APIClient {
    
    static func getRooms() -> Promise<[Room1]> {
        return performRequest(route: RoomsEndPoints.getRooms)
    }
    
    static func getUsers() -> Promise<[User]> {
        return performRequest(route: RoomsEndPoints.getUsers)
    }
    
    static func AddRoom (name:String , subject:String, users: [Dictionary<String,Any>]) -> Promise<Room1> {
           return performRequest(route: RoomsEndPoints.AddRoom(name: name, subject: subject, users: users))
       }
    
    static func getRoomById(id: Int) -> Promise<[Messenger1]> {
        return performRequest(route: RoomsEndPoints.getRoombyId(id: id))
    }
    
    static func PostMsg(type: String, file: String, room: [String: Any], user: [String: Any], body: String)-> Promise<Messenger1>{
        return performRequest(route: RoomsEndPoints.PostMsg(type: type, file: file, room: room, user: user, body: body))

    }
    
    static func posImage(type: String,body: String,user: [String: Any], room: [String: Any], file: String)-> Promise<Messenger1>{
        return performRequest(route: RoomsEndPoints.PostImage(type: type, body: body, user: user, room: room, file: file))

    }
    
}
