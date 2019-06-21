//
//  ContactsTableView.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/21/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

protocol ContactsTableViewDelegate: class {
    func navigateToDetailViewOf(_ contact: ContactModel)
}

class ContactsTableView: UITableView {
    
    weak var contactsTableViewDelegate: ContactsTableViewDelegate?
    
    var dataSourceArray = [ContactModel]() {
        didSet {
            self.reloadData()
        }
    }

    override func awakeFromNib() {
        self.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
        
        self.delegate = self
        self.dataSource = self
    }

}

extension ContactsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactsTableViewDelegate?.navigateToDetailViewOf(dataSourceArray[indexPath.row])
    }
}

extension ContactsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        cell.configureCell(dataSourceArray[indexPath.row])
        return cell
    }
    
    
}
