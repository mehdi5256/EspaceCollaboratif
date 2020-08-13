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
                    print("body")
                    print(body)

                  try! eventBus.send(to: channel, body: body)
                  fulfill("success")
               } catch let error {
                  reject(error)
               }
          }
     }
   
     @discardableResult
       static func performRequest<T: Decodable>(bodyJson: JSON, decoder: JSONDecoder = JSONDecoder())->Promise<T> {
        print (bodyJson)
           return Promise<T> { fulfill, reject in
             let jsonData = bodyJson.description.data(using: .utf8)!
             do {
                 let object = try JSONDecoder().decode(T.self, from: jsonData)
                 fulfill(object)
             } catch let error as NSError {
                reject(error)
             }
       }
    }
   
    @discardableResult
       static func performRequestReaction(bodyJson: JSON)->Promise<Reaction> {
           return Promise<Reaction> { fulfill, reject in
             do {
                 let jsonData = bodyJson["reaction"].description.data(using: .utf8)!
                 let jsonDataMessage = bodyJson["message"].description.data(using: .utf8)!
                 do {
                     var objectReaction = try JSONDecoder().decode(Reaction.self, from: jsonData)
                     let objectMessage = try JSONDecoder().decode(Messenger1.self, from: jsonDataMessage)
                     objectReaction.message = objectMessage
                     fulfill(objectReaction)
                 } catch let error as NSError {
                     reject(error)
                 }
             } catch let error as NSError {
                reject(error)
             }
       }
    }
}
