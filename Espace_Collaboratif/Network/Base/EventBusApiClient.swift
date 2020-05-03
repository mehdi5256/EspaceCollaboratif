//
//  EventBusApiClient.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/3/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

//
//  EventBusAPIClient.swift
//  AccretionSlido
//
//  Created by hamadi aziz on 17/04/2020.
//  Copyright © 2020 hamadi aziz. All rights reserved.
//

import Foundation
import Promises
import SwiftyJSON

class EventBusApiClient {
    
    @discardableResult
    static func performConnectRequest(eventBus: EventBus)->Promise<String> {
             return Promise<String> { fulfill, reject in
                //connect methode
                do {
                    
                    try eventBus.connect()

                   
                   fulfill("success")
                } catch let error {
                   reject(error)
                }
           }
      }
   
   @discardableResult
   static func performSendRequest(eventBus: EventBus, body : Dictionary<String,Any>, channel : String)->Promise<String> {
            return Promise<String> { fulfill, reject in
               //connect methode
               do {
                  if !eventBus.connected() {
                     try eventBus.connect()
                  }
                  try! eventBus.send(to: channel, body: body)
                  fulfill("success")
               } catch let error {
                  reject(error)
               }
          }
     }
   
   @discardableResult
      static func performRequest(bodyJson: JSON)->Promise<Messenger1> {
          return Promise<Messenger1> { fulfill, reject in
            do {
                let msgs = Messenger1(body: bodyJson["body"].description, file: bodyJson["file"].description, id: nil ,timestamp: nil,usert: bodyJson["user"].description, type: bodyJson["type"].description, user: User(id: UserDefaultLogged.idUD, firstName: bodyJson["user"].description, lastName: "", email: UserDefaultLogged.emailUD, image: bodyJson["user_img"].description, rooms:[]))
                fulfill(msgs)
            } catch let error as NSError {
               reject(error)
            }
      }
   }
   
}
