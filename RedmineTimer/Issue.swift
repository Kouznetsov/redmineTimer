//
//  Issue.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import Foundation
import ObjectMapper

class Issues: Mappable {
    //MARK: Properties
    var issuesArray: [Issue] = [Issue]()
    
    //MARK: Initializers
    init?() {
        
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //MARK: Mappable
    func mapping(map: Map) {
        issuesArray     <- map["issues"]
    }
}

class Issue: Mappable {
    
    //MARK: Properties
    var id: Int = -1
    var project: String = "-"
    var tracker: String = "-"
    var status: String = "-"
    var priority: String = "-"
    var author: String = "-"
    var assignedTo: String = "-"
    var category: String = "-"
    var subject: String = "-"
    var description: String = "-"
    var startDate: String = "-"
    var doneRatio: Int = 0

    //MARK Initializers
    init?() {
        
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //MARK: Mappable
    func mapping(map: Map) {
        id          <- map["id"]
        project     <- map["project.name"]
        tracker     <- map["tracker.name"]
        status      <- map["status.name"]
        priority    <- map["priority.name"]
        author      <- map["author.name"]
        assignedTo  <- map["assigned_to.name"]
        category    <- map["category.name"]
        subject     <- map["subject"]
        description <- map["description"]
        startDate   <- map["start_date"]
        doneRatio   <- map["done_ratio"]
    }
    
}
