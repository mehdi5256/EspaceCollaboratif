//
//  RoomCoreData+CoreDataProperties.swift
//  
//
//  Created by mehdi on 5/15/20.
//
//

import Foundation
import CoreData


extension RoomCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomCoreData> {
        return NSFetchRequest<RoomCoreData>(entityName: "RoomCoreData")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var subject: String?
    @NSManaged public var messages: NSSet?
    @NSManaged public var users: [UserCoreData]

}

//// MARK: Generated accessors for messages
//extension RoomCoreData {
//
//    @objc(addMessagesObject:)
//    @NSManaged public func addToMessages(_ value: MessageCoreData)
//
//    @objc(removeMessagesObject:)
//    @NSManaged public func removeFromMessages(_ value: MessageCoreData)
//
//    @objc(addMessages:)
//    @NSManaged public func addToMessages(_ values: NSSet)
//
//    @objc(removeMessages:)
//    @NSManaged public func removeFromMessages(_ values: NSSet)
//
//}

// MARK: Generated accessors for users
extension RoomCoreData {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: UserCoreData)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: UserCoreData)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
