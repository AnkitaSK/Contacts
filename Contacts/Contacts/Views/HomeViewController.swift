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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentor?.startfetchingContacts()
    }


}

extension HomeViewController: PresenterToViewProtocol {
    
}
