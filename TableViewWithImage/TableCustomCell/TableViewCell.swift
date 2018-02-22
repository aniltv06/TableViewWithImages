//
//  TableViewCell.swift
//  TableViewWithImage
//
//  Created by Anil T V on 22/02/18.
//  Copyright © 2018 Anil Kumar T V. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

