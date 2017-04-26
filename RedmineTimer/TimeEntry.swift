//
//  TimeEntry.swift
//  RedmineTimer
//
//  Created by Karim Harat on 25/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import Foundation
import ObjectMapper

class TimeEntryContainer: Mappable {
    
    //MARK: Properties
    var entry: TimeEntryObject = TimeEntryObject()
    
    //MARK: Initializers
    init() {}
    
    init(_ issue: Issue, hours: Double, activityId: Int) {
        self.entry = TimeEntryObject(issue, hours: hours, activityId: activityId)
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //MARK: Private Methods
    func mapping(map: Map) {
        entry       <- map["time_entry"]
    }
    
}

class TimeEntryObject {
    
    //MARK: Properties
    var issueId = -1
    var projectId = ""
    var hours = Double()
    var activityId = -1
    
    //MARK: Initializers
    init() {}
    
    init(_ issue: Issue, hours: Double, activityId: Int) {
        self.issueId = issue.id
        self.projectId = issue.project
        self.hours = hours
        self.activityId = activityId
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //MARK: Private functions
    func mapping(map: Map) {
        issueId         <- map["issue_id"]
        projectId       <- map["project_id"]
        hours           <- map["hours"]
        activityId      <- map["activity_id"]
    }
}
