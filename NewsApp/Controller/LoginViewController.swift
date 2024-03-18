//
//  LoginViewController.swift
//  NewsApp
//
//  Created by Ankit Yadav on 13/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButtonClicked: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        loginButton.layer.cornerRadius = 12.0
        signUpButton.layer.cornerRadius = 12.0
        super.viewDidLoad()

    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let controller = LoginFormViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let controller = SignUpFormViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
