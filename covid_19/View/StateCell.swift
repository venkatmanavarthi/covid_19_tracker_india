//
//  StateCell.swift
//  covid_19
//
//  Created by manavarthivenkat on 24/05/20.
//  Copyright © 2020 manavarthivenkat. All rights reserved.
//

import UIKit

class StateCell: UITableViewCell {
    
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    
    @IBOutlet weak var activeLabel: UILabel!
    
    @IBOutlet weak var deaths: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
