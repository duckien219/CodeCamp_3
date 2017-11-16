//
//  CustomCollectionViewCell.swift
//  CodeCamp_3
//
//  Created by Kien Nguyen Duc on 11/11/17.
//  Copyright © 2017 Kien Nguyen Duc. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var room: RoomManagedObject? {
        didSet{
            imageRoom.image = UIImage(named: (room?.imageRoom)!)
            nameRoom.text = room?.name
        }
    }
    @IBOutlet weak var imageRoom: UIImageView!
    @IBOutlet weak var nameRoom: UILabel!
}
