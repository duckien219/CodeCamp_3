//
//  RoomManagedObject+CoreDataProperties.swift
//  CodeCamp_3
//
//  Created by Kien Nguyen Duc on 11/11/17.
//  Copyright © 2017 Kien Nguyen Duc. All rights reserved.
//
//

import Foundation
import CoreData


extension RoomManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomManagedObject> {
        return NSFetchRequest<RoomManagedObject>(entityName: "Room")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var imageRoom: String?
    @NSManaged public var students: NSSet?
    
}

// MARK: Generated accessors for students
extension RoomManagedObject {
    
    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: StudentManagedObject)
    
    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: StudentManagedObject)
    
    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)
    
    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)
    
    
    static func insertNewRoom(name: String, imageRoom: String) -> RoomManagedObject? {
        let room = NSEntityDescription.insertNewObject(forEntityName: "Room", into: AppDelegate.managedObjectContext!) as! RoomManagedObject
        room.name = name
        room.imageRoom = imageRoom
        do {
            try AppDelegate.managedObjectContext?.save()
            
        } catch {
            print("Cannot insert new room")
            print(error.localizedDescription)
        }
        return room
    }
    static func getAllRoom() -> [RoomManagedObject] {
        var result = [RoomManagedObject]()
        let context = AppDelegate.managedObjectContext
        do{
            result = try context!.fetch(RoomManagedObject.fetchRequest()) as! [RoomManagedObject]
        } catch{
            print(error.localizedDescription)
        }
        return result
    }
    
        
    
}
