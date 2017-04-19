//
//  Issue.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import Foundation
import ObjectMapper

class Issue: Mappable {
    var id: Int = -1
    var project: String = "-"
    var tracker: String = "-"
    var status: String = "-"
    var priority: String = "-"
    var author: String = "-"
    var assignedTo: String = "-"
    var category: String = "-"
    var subject: String = "Unknown subject"
    var description: String = "Unknown description"
    var startDate: String = "Unknown start date"
    var doneRatio: Int = 0

    required init?(map: Map) {
        
    }
    
    //MARK: Mappable
    func mapping(map: Map) {
        id          <- map["id"]
        project     <- map["project"]["name"]
        tracker     <- map["tracker"]["name"]
        status      <- map["status"]["name"]
        priority    <- map["priority"]["name"]
        author      <- map["author"]["name"]
        assignedTo  <- map["assigned_to"]["name"]
        category    <- map["category"]["name"]
        subject     <- map["subject"]
        description <- map["description"]
        startDate   <- map["start_date"]
        doneRatio   <- map["done_ratio"]
    }
    
}
