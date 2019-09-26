//
//  HistoryCell.swift
//  vr tour
//
//  Created by student on 3/9/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    func setupCell(user: User)  {
        nameLabel.text = "\(user.name)"
        scoreLabel.text = "\(user.score)"
    }

}
