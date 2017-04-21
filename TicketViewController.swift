//
//  TicketViewController.swift
//  RedmineTimer
//
//  Created by karim on 20/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    var issue = Issue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let issue = issue {
            authorLabel.text = "By \(issue.author)"
            dateLabel.text = "Created on \(issue.startDate)"
            titleLabel.text = issue.subject
            descLabel.text = issue.description
            title = "#\(issue.id)"
        }
    }
    
    @IBAction func onAddTimeClick(_ sender: UIButton) {
        
    }

}
