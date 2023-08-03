//
//  CommonTableViewCell.swift
//  ReminderNotesDemo
//
//  Created by appler on 26.07.23.
//

import UIKit

class CommonTableViewCell: UITableViewCell {

    
//    @IBOutlet weak var selectedOutlet: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func selectedAction(_ sender: Any) {
//        selectedOutlet.image = UIImage(named: "pencil.circle.fill")
        print("okkkk")
    }
    
}
