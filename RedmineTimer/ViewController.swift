//
//  ViewController.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var userEdit: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    var isLoading: Bool = false {
        didSet {
            isLoading(isLoading)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.isHidden = true
    }
    
    //MARK: Actions
    @IBAction func onLoginClick(_ sender: UIButton) {
        isLoading = true
        NetworkManager
            .GetMyIssues(username: userEdit.text!,
                       password: password.text!,
                       completion: { (issues) in
                        if issues == nil {
                            return
                        }
                        self.isLoading = false
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        let ticketsVC = storyBoard.instantiateViewController(withIdentifier: "TicketsViewController") as! TicketsTableViewController
                        
                        dump(issues)
                        ticketsVC.issues = issues!
                        self.navigationController?.pushViewController(ticketsVC, animated: true)
        })
    }
    
    //MARK: Private Functions
    private func isLoading(_ isLoading: Bool) {
        userEdit.isEnabled = !isLoading
        password.isEnabled = !isLoading
        loginBtn.isEnabled = !isLoading
        progressIndicator.isHidden = !isLoading
        if isLoading {
            progressIndicator.startAnimating()
        }
    }
}

