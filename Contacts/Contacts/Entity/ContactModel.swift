//
//  ContactModel.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class ContactModel: Serializable {
    var contactId: Int?
    var firstName: String?
    var lastName: String?
    var profilePicURL: String?
    var isFavorite: Bool?
    var contactURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case contactId = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePicURL = "profile_pic"
        case isFavorite = "favorite"
        case contactURL = "url"
    }
    
    init(contactId: Int, firstName: String, lastName: String, profilePicURL: String, isFavorite: Bool, contactURL: String) {
        self.contactId = contactId
        self.firstName = firstName
        self.lastName = lastName
        self.profilePicURL = profilePicURL
        self.isFavorite = isFavorite
        self.contactURL = contactURL
    }
}
/*
 "id": 1,
 "first_name": "Amitabh",
 "last_name": "Bachchan",
 "profile_pic": "https://contacts-app.s3-ap-southeast-1.amazonaws.com/contacts/profile_pics/000/000/007/original/ab.jpg?1464516610",
 "favorite": false,
 "url": "https://gojek-contacts-app.herokuapp.com/contacts/1.json"
 */
