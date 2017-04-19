//
//  ViewController.swift
//  RedmineTimer
//
//  Created by karim on 19/04/2017.
//  Copyright © 2017 brocelia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

