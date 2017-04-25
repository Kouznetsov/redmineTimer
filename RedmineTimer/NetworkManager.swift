//
//  NetworkManager.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkManager {
    static let rootUrl: String = "https://redmine.brocelia.net"
    static var currentAuthHeader =  ["Authorization": "NULL"]
    
    static func GetMyIssues(username: String, password: String, completion: @escaping ([Issue]?) -> Void) {
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedData()
        let dataString = String(data: base64Credentials, encoding: String.Encoding.utf8)
        
        currentAuthHeader = ["Authorization": "Basic \(dataString ?? "")"]
        Alamofire.request(rootUrl + "/issues.json?assigned_to_id=me", headers: currentAuthHeader)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                
                guard let value = response.result.value as? [String: Any] else {
                        print("Malformed data received from service")
                        completion(nil)
                        return
                }
                //let issues = Mapper<Issue>().mapArray(JSONArray: [value])
                let issues = Mapper<Issues>().map(JSON: value)
                dump(issues)
                completion(issues?.issuesArray)
        }
    }
    
    //static func PostTimeEntry(@escaping ()) {
        
    //}
    
}
