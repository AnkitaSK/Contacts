//
//  BaseService.swift
//  Contacts
//
//  Created by Kalangutkar Ankita Vinod on 6/20/19.
//  Copyright © 2019 Kalangutkar Ankita Vinod. All rights reserved.
//

import UIKit

enum ServiceType: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}

protocol Serializable: Codable {
    func serialize() -> Data?
}

/// MARK: - Extension to Serializable
extension Serializable {
    /// Json Encoder for the ecoding the data
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

public typealias HTTPHeaders = [String: String]

class BaseService: NSObject {
    
    var requestBody: [String: AnyObject] = ["": "" as AnyObject]
    var serviceType: ServiceType!
    var serviceURL: String = ""
    var headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    weak var serviceCallDelegate: ServiceCallDelegate?
    override init() {
        super.init()
    }
    
    convenience init(serviceType: ServiceType, serviceUrl: String, requestData: Data? = nil) {
        self.init()
        self.serviceType = serviceType
        self.serviceURL = serviceUrl
        if let requestData = requestData, let requestBody = Utilities.convertToDict(data: requestData) {
            self.requestBody = requestBody
        }
    }
    
    func startService() {
        let defaultSession = URLSession(configuration: .default)
        
        var request: URLRequest = URLRequest(url: URL(string: serviceURL)!)
        
        request.allHTTPHeaderFields = headers
        request.httpMethod = serviceType.rawValue
        
        if serviceType == .POST || serviceType == .PUT {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        let dataTask = defaultSession.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
//                 handle error
                self.serviceCallDelegate?.receivedError(error)
            } else if let httpResponse = response as? HTTPURLResponse {
                do {
                    if let data = data, let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        print(json)
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                }
                
                if httpResponse.statusCode != 200 {
//                    TODO handle error
                } else {
//                    TODO handle response -- delegate call to interactor
                    if let responseData = data {
                        self.serviceCallDelegate?.receivedData(responseData)
                    }
                }
            } else {
                defaultSession.finishTasksAndInvalidate()
            }
        }
        dataTask.resume()
    }
}
