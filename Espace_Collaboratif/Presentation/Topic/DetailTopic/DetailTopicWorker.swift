//
//  DetailTopicWorker.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/7/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Promises

class DetailTopicWorker
{
  func doSomeWork()
  {
  }
    func PostReply(reply:String,topic:[String: Any],user:[String: Any])-> Promise<Reply1>
    {
        return RoomAPIClient.zidReply(reply: reply, topic: topic, user: user)
    }
    
    
    
}
    

