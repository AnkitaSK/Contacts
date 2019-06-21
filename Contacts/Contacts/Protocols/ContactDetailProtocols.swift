//
//  ContactDetailProtocols.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/21/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

protocol PresenterToRouterDetailProtocol {
    static func createModule() -> ContactsDetailViewController
}
