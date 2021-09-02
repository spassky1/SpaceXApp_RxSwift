//
//  RocketCell.swift
//  SpaceXApp
//
//  Created by Arda on 24.08.2021.
//

import UIKit

class RocketCell: UITableViewCell {

    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var missionName: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
