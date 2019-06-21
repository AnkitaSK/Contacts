//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/21/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactsNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(_ model: ContactModel) {
        contactsNameLabel.text = (model.firstName ?? "") + (model.lastName ?? "")
    }
}


