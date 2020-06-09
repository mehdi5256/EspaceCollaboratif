//
//  UserCoreData+CoreDataProperties.swift
//  
//
//  Created by mehdi on 5/15/20.
//
//

import Foundation
import CoreData


extension UserCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreData> {
        return NSFetchRequest<UserCoreData>(entityName: "UserCoreData")
    }

    @NSManaged public var imageCD: String?
    @NSManaged public var rooms: NSSet?

}

// MARK: Generated accessors for rooms
extension UserCoreData {

    @objc(addRoomsObject:)
    @NSManaged public func addToRooms(_ value: RoomCoreData)

    @objc(removeRoomsObject:)
    @NSManaged public func removeFromRooms(_ value: RoomCoreData)

    @objc(addRooms:)
    @NSManaged public func addToRooms(_ values: NSSet)

    @objc(removeRooms:)
    @NSManaged public func removeFromRooms(_ values: NSSet)

}
