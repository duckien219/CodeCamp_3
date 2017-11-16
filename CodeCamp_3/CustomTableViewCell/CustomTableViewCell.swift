//
//  CustomTableViewCell.swift
//  CodeCamp_3
//
//  Created by Kien Nguyen Duc on 11/11/17.
//  Copyright © 2017 Kien Nguyen Duc. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageStudent: UIImageView!
    @IBOutlet weak var nameStudent: UILabel!
    @IBOutlet weak var addressStudent: UILabel!
    
    var student: StudentManagedObject? {
        didSet {
            guard let student = student else {
                return
            }
            nameStudent.text = student.name
            addressStudent.text = student.address
            imageStudent.image = UIImage(named: student.imageStudent!)
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
