//
//  ViewController.swift
//  CodeCamp_3
//
//  Created by Kien Nguyen Duc on 11/11/17.
//  Copyright © 2017 Kien Nguyen Duc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var roomList = [RoomManagedObject]()
    // Tổng số thành viên trong lớp
    //    var iosTotal = Set<StudentManagedObject>()
    //    var nodejsTotal = Set<StudentManagedObject>()
    //    var arduinoTotal = Set<StudentManagedObject>()
    //    var javaTotal = Set<StudentManagedObject>()
    //    var websiteTotal = Set<StudentManagedObject>()
    //    var htmlTotal = Set<StudentManagedObject>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionRoomList()
        setupCollectionView()
        
    }
    
    func collectionRoomList() {
        if checkingData() == false {
            print("Data fetched")
        }
        else if checkingData() == true {
            print("Need Fetching Data")
        }
        
        
    }
    
    func checkingData() -> Bool {
        //        getAllRoom()
        if roomList.count > 0 {
            return false
        }
        else if roomList.count == 0 {
            createData()
            
            return true
        }
        else {
            return false
        }
        
    }
    
    func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    
    func createData(){
        
        let ios = RoomManagedObject.insertNewRoom(name: "iOS", imageRoom: "ios.jpg")
        let nodejs = RoomManagedObject.insertNewRoom(name: "Node JS", imageRoom: "nodejs.jpg")
        let arduino = RoomManagedObject.insertNewRoom(name: "Arduino", imageRoom: "arduino")
        let java = RoomManagedObject.insertNewRoom(name: "Java", imageRoom: "java.jpg")
        let website = RoomManagedObject.insertNewRoom(name: "Website", imageRoom: "website.jpg")
        let html = RoomManagedObject.insertNewRoom(name: "HTML", imageRoom: "html.jpg")
        
        if let student1 = StudentManagedObject.insertNewStudent(name: "Nguyen Duc Kien", address: "Ha Noi", imageStudent: "1.jpg") {
            ios?.addToStudents(student1)
        }
        
        if let student2 = StudentManagedObject.insertNewStudent(name: "Alyssa", address: "Paris", imageStudent: "2.jpg") {
            nodejs?.addToStudents(student2)
        }
        
        if let student3 = StudentManagedObject.insertNewStudent(name: "John", address: "Manchester", imageStudent: "3.jpg") {
            arduino?.addToStudents(student3)
        }
        
        if let student4 = StudentManagedObject.insertNewStudent(name: "Stephanie", address: "Berlin", imageStudent: "4.jpg") {
            java?.addToStudents(student4)        }
        
        if let student5 = StudentManagedObject.insertNewStudent(name: "Arianna", address: "Amsterdam", imageStudent: "5.jpg") {
            website?.addToStudents(student5)
        }
        
        if let student6 = StudentManagedObject.insertNewStudent(name: "Alex", address: "Tokyo", imageStudent: "6.jpg") {
            html?.addToStudents(student6)
        }
        
        if let student7 = StudentManagedObject.insertNewStudent(name: "Ronaldo", address: "Madrid", imageStudent: "7.jpg") {
            nodejs?.addToStudents(student7)
        }
        
        if let student8 = StudentManagedObject.insertNewStudent(name: "Messi", address: "Argentina", imageStudent: "8.jpg") {
            ios?.addToStudents(student8)
        }
        
        if let student9 = StudentManagedObject.insertNewStudent(name: "Giroud", address: "France", imageStudent: "9.jpg") {
            ios?.addToStudents(student9)
        }
        
        if let student10 = StudentManagedObject.insertNewStudent(name: "Bale", address: "Wale", imageStudent: "10.jpg") {
            ios?.addToStudents(student10)
        }
        
        roomList.append(ios!)
        roomList.append(nodejs!)
        roomList.append(arduino!)
        roomList.append(java!)
        roomList.append(website!)
        roomList.append(html!)
        
        
        
        
        
    }
    
    
    //    func getAllStudent() {
    //
    //        let students = StudentManagedObject.getAllStudent()
    //        if students.count == 0 {
    //            print("No Student Founded")
    //            return
    //        }
    //        var arrayStudent = [String]()
    //        for student in students {
    //            arrayStudent.append(student.name!)
    //
    //        }
    //
    //    }
    //    func getAllRoom() {
    //        let rooms = RoomManagedObject.getAllRoom()
    //        if rooms.count == 0 {
    //            print("No Student Founded")
    //            return
    //        }
    //        for room in rooms {
    //            roomList.append(room)
    //        }
    //    }
    
    
    
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CustomCollectionViewCell
        
        let room = roomList[indexPath.item]
        collectionViewCell?.room = room
        
        return collectionViewCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let studentList = StudentListVC()
        
        for room in roomList {
            
            let studentInRoom = room.students?.allObjects
            if room == roomList[indexPath.item] {
                //            print("Object in Room: \(studentInRoom)")
                studentList.arrayStudents = studentInRoom as! [StudentManagedObject]
            }
        }
        self.navigationController?.pushViewController(studentList, animated: true)
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
}






