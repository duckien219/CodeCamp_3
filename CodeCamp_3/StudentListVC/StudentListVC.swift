//
//  StudentListVC.swift
//  CodeCamp_3
//
//  Created by Kien Nguyen Duc on 11/11/17.
//  Copyright © 2017 Kien Nguyen Duc. All rights reserved.
//

import UIKit

class StudentListVC: UIViewController {
    
    @IBOutlet weak var studentListTableView: UITableView!
    
    var arrayStudents = [StudentManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentListTableView.delegate = self
        studentListTableView.dataSource = self
        studentListTableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        //        self.navigationController?.navigationBar.isHidden = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addStudent))
        
    }
    
    @objc func addStudent() {
        print("added")
        let student = StudentManagedObject.insertNewStudent(name: "Blank", address: "Blank", imageStudent: "newStudent")!
        arrayStudents.append(student)
        saveContext()
        studentListTableView.reloadData()
    }
    
    fileprivate func saveContext() {
        do {
            try AppDelegate.managedObjectContext?.save()
            studentListTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = studentListTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let student = arrayStudents[indexPath.row]
        cell.student = student
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateStudent = EditStudentVC()
        self.navigationController?.pushViewController(updateStudent, animated: true)

    }
}


