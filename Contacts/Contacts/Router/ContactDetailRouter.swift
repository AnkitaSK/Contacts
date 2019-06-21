//
//  ContactDetailRouter.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/21/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class ContactDetailRouter: PresenterToRouterDetailProtocol {
    static func createModule() -> ContactsDetailViewController {
        let view = ContactDetailRouter.mainStoryboard.instantiateViewController(withIdentifier: "ContactsDetailViewController") as! ContactsDetailViewController
        
        return view
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
