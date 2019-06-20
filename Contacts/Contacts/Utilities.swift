//
//  Utilities.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

class Utilities: NSObject {

    class func convertToDict(data: Data?) -> [String: AnyObject]? {
        do {
            if let data = data {
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
