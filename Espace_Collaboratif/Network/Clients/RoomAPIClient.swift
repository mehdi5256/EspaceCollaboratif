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
    
    static func getroomrequest(token: String) -> Promise<[RoomRequest1]> {
        return performRequest(route: RoomsEndPoints.getRoomsRequest(token: token))
    }
    
    
    static func zidReply(reply:String,topic:[String: Any],user:[String: Any]) -> Promise<Reply1> {
     return performRequest(route: RoomsEndPoints.zidReply(reply: reply, topic: topic, user: user))
    }
    
    static func getRooms(token: String) -> Promise<[Room1]> {
        return performRequest(route: RoomsEndPoints.getRooms(token: token))
    }
    
    static func getUsers() -> Promise<[User]> {
        return performRequest(route: RoomsEndPoints.getUsers)
    }
    
    static func AddRoom (name:String , subject:String, user:[String: Any], isPrivate: Bool, users: [Dictionary<String,Any>]) -> Promise<Room1> {
        return performRequest(route: RoomsEndPoints.AddRoom(name: name, subject: subject, user: user, isPrivate: isPrivate,  users: users))
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
    
    static func getRoomEventBus(id: Int) -> Promise<Room1> {
           return performRequest(route: RoomsEndPoints.getRoomIdEventBus(id: id))
       }
    
}
