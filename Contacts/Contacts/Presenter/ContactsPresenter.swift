//
//  ContactsPresenter.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class ContactsPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startfetchingContacts() {
//
        interactor?.fetchContacts()
    }
    
    func navigateToDetailViewController() {
//        TODO
        router?.navigateToDetailViewController()
    }
    
    func addNewContact() {
//        TODO
    }
    

}

extension ContactsPresenter: InteractorToPresenterProtocol {
    func fetchedContacts(_ contacts: [ContactModel]) {
        view?.displayFetchedContacts(contacts)
    }
}
