//
//  GenericMethods.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/21/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class GenericMethods: NSObject {

}

class CustomJSONDecoder: JSONDecoder {
    class func decodeResponseModelArrayObject<T: Serializable>(model: T.Type, data: Data?) -> [T]? {
        do {
            if let dataForParsing = data {
                let responseData = try JSONDecoder().decode([T].self, from: dataForParsing)
                return responseData
            }
            return nil
        } catch let error {
            print(error)
            return nil
        }
    }
}
