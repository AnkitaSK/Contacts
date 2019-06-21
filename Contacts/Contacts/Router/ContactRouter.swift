//
//  ContactRouter.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class ContactRouter: PresenterToRouterProtocol {
    static func createModule() -> HomeViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ContactsPresenter()
        var interactor: PresenterToInteractorProtocol = ContactInteracter()
        let router:PresenterToRouterProtocol = ContactRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToDetailViewController() {
//        TODO navigation to detail
        
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
