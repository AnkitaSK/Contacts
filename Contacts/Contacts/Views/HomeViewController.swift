//
//  ViewController.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presentor: ViewToPresenterProtocol?
    
    @IBOutlet weak var contactTableView: ContactsTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.contactsTableViewDelegate = self
        
        presentor?.startfetchingContacts()
    }


}

extension HomeViewController: PresenterToViewProtocol {
    func displayFetchedContacts(_ contacts: [ContactModel]) {
        DispatchQueue.main.async {
            self.contactTableView.dataSourceArray = contacts
        }
    }
}


extension HomeViewController: ContactsTableViewDelegate {
    func navigateToDetailViewOf(_ contact: ContactModel) {
        presentor?.navigateToDetailViewController()
    }
}
