//
//  StudentManagedObject+CoreDataProperties.swift
//  CodeCamp_3
//
//  Created by Kien Nguyen Duc on 11/11/17.
//  Copyright © 2017 Kien Nguyen Duc. All rights reserved.
//
//

import Foundation
import CoreData


extension StudentManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentManagedObject> {
        return NSFetchRequest<StudentManagedObject>(entityName: "Student")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var imageStudent: String?
    @NSManaged public var address: String?
    @NSManaged public var rooms: NSSet?
    
}

// MARK: Generated accessors for rooms
extension StudentManagedObject {
    
    @objc(addRoomsObject:)
    @NSManaged public func addToRooms(_ value: RoomManagedObject)
    
    @objc(removeRoomsObject:)
    @NSManaged public func removeFromRooms(_ value: RoomManagedObject)
    
    @objc(addRooms:)
    @NSManaged public func addToRooms(_ values: NSSet)
    
    @objc(removeRooms:)
    @NSManaged public func removeFromRooms(_ values: NSSet)
    
    
    static func insertNewStudent(name: String, address:String, imageStudent: String) -> StudentManagedObject? {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: AppDelegate.managedObjectContext!) as! StudentManagedObject
    
        
        student.name = name
        student.address = address
        student.imageStudent = imageStudent
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            
            print(error.localizedDescription)
        }
        return student
    }
    
    
    static func getAllStudent() -> [StudentManagedObject] {
        
        var result = [StudentManagedObject]()
        let context = AppDelegate.managedObjectContext
        do{
           result = try context!.fetch(StudentManagedObject.fetchRequest()) as! [StudentManagedObject]
        } catch{
            print(error.localizedDescription)
        }
        return result
    }
}
