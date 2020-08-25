//
//  UserAPIClient.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/25/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Promises

class TopicAPIClient: APIClient {
    
    static func getalltopics() -> Promise<[Topic1]> {
        return performRequest(route: TopicEndPoints.getalltopics)
    }
    
    static func PostReply(reply:String,topic:[String: Any],user:[String: Any])-> Promise<Reply1>{
           return performRequest(route: TopicEndPoints.PostReply(reply: reply, topic: topic, user: user))

       }
    
   
    
}

