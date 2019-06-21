//
//  ContactInteracter.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class ContactInteracter: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    
    func fetchContacts() {
        let url = "http://gojek-contacts-app.herokuapp.com/contacts.json"
        let baseService = BaseService(serviceType: .GET, serviceUrl: url)
        baseService.serviceCallDelegate = self
        baseService.startService()
        
    }
    
    
}


extension ContactInteracter: ServiceCallDelegate {
    func receivedData(_ data: Data) {
        if let responseData = CustomJSONDecoder.decodeResponseModelArrayObject(model: ContactModel.self, data: data) {
            presenter?.fetchedContacts(responseData)
        }
    }
    
    func receivedError(_ error: Error) {
        
    }
}
