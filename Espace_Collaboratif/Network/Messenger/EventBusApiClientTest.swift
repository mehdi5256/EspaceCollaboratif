//
//  EventBusApiClient.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/3/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Promises
import SwiftyJSON

class EventBusApiClientTest: EventBusApiClient{

static func Connect(eventBus: EventBus) -> Promise<String> {
   return performConnectRequest(eventBus: eventBus)
}
    
    static func Send(eventBus: EventBus, body: Dictionary<String,Any>, channel: String) -> Promise<String> {
       return performSendRequest(eventBus: eventBus, body: body, channel: channel)
    }

static func presentMessenger(bodyJson: JSON) -> Promise<Messenger1> {
   return performRequest(bodyJson: bodyJson)
    }
    
}
