//
//  ContactProtocols.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func startfetchingContacts()
    func navigateToDetailViewController()
    func addNewContact()
}

protocol PresenterToViewProtocol {
    
}

protocol PresenterToRouterProtocol {
    static func createModule() -> HomeViewController
    func navigateToDetailViewController()
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchContacts()
}

protocol InteractorToPresenterProtocol {
    
}
