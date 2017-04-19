//
//  Issue.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import Foundation

class Issue {
    var id: Int = -1
    var project: Project = Project()
    var tracker: Tracker = Tracker()
    var status: Status = Status()
    var priority: Priority = Priority()
    var author: Author = Author()
    var assignedTo: AssignedTo = AssignedTo()
    var category: Category = Category()
    var fixedVersion: FixedVersion = FixedVersion()
    var subject: String = "Unknown subject"
    var description: String = "Unknown description"
    var startDate: String = "Unknown start date"
    var doneRatio: Int = 0
    
    @objc 
}

class Project {
    var id: Int = -1
    var name: String = "Unknown project"
}

class Tracker {
    var id: Int = -1
    var name: String = "Unknown tracker"
}

class Status {
    var id: Int = -1
    var name: String = "Unknown status"
}

class Priority {
    var id: Int = -1
    var name: String = "Unknown priority"
}

class Author {
    var id: Int = -1
    var name: String = "Unknown author"
}

class AssignedTo {
    var id: Int = -1
    var name: String = "Unknown assigned"
}

class Category {
    var id: Int = -1
    var name: String = "Unknown category"
}

class FixedVersion {
    var id: Int = -1
    var name: String = "Unknown fixed version"
}
