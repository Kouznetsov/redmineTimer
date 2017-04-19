//
//  NetworkManager.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let rootUrl: String = "https://redmine.brocelia.net"
    static var currentAuthHeader =  ["Authorization": "NULL"]
    
    static func GetIssues(username: String, password: String, completion: @escaping ([String]) -> Void) {
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedData()
        
        currentAuthHeader = ["Authorization": "Basic \(base64Credentials)"]
        Alamofire.request(rootUrl + "/issues.json",
                          headers: currentAuthHeader)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(String(describing: response.result.error))")
                    completion([String]())
                    return
                }
                guard let jsonResponse = response.result.value as? [String: Any] else {
                    print("Invalid tag information received from the service")
                    completion([String]())
                    return
                }
                
                print(jsonResponse)
                completion([String]())
        }
    }
    
}
