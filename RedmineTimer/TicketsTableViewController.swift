//
//  TicketsTableViewController.swift
//  RedmineTimer
//
//  Created by karim on 20/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import UIKit

class TicketsTableViewController: UITableViewController {

    //MARK: Properties
    var issues = [Issue]()
    var activities = [String: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "TicketTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? TicketCellTableViewCell else {
            fatalError("The dequeued cell is not an instance of TicketTableViewCell")
        }
        let issue = issues[indexPath.row]
        
        cell.amountDone.text = "\(issue.doneRatio) %"
        cell.desc.text = issue.description
        cell.title.text = issue.subject
        cell.status.text = issue.status
        cell.timeSpent.text = issue.startDate
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
            case "ShowIssue":
                guard let showIssueVC = segue.destination as? TicketViewController else {
                    fatalError("Unexpected destination \(segue.destination)")
                }
                guard let selectedIssueCell = sender as? TicketCellTableViewCell else {
                    fatalError("unexpected sender \(String(describing: sender))")
                }
                guard let indexPath = tableView.indexPath(for: selectedIssueCell) else {
                    fatalError("did not find \(selectedIssueCell)")
                }
                let selectedIssue = issues[indexPath.row]
            
                showIssueVC.issue = selectedIssue
            default:
                print("Unexcpected segue")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
}
