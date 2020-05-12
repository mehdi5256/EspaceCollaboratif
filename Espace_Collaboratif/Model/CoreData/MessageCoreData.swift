//
//  RoomCoreData.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/11/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import CoreData
class MessageCoreData: NSManagedObject{
    

static var all: [[MessageCoreData]] {
       let request: NSFetchRequest<MessageCoreData> = MessageCoreData.fetchRequest()
    request.sortDescriptors = [
        NSSortDescriptor(key: "room.name", ascending: false)
    ]
       guard let msgscrdata = try? AppDelegate.viewContext.fetch(request) else { return [] }
    return msgscrdata.convertedToArrayOfArray
   }
 }

extension Array where Element == MessageCoreData {
    var convertedToArrayOfArray: [[MessageCoreData]] {
        var dict = [RoomCoreData: [MessageCoreData]]()

        for message in self where message.room != nil {
            dict[message.room!, default: []].append(message)
        }

        var result = [[MessageCoreData]]()
        for (_, val) in dict {
            result.append(val)
        }

        return result
    }
}
