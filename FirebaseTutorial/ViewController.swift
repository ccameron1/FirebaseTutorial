//
//  ViewController.swift
//  FirebaseTutorial
//
//  Created by Carly Cameron on 7/15/20.
//  Copyright © 2020 Carly Cameron. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onGoPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { authResult, error in
          // ...
        }
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
          guard let strongSelf = self else {
            return }
            if error != nil {
                print(error.debugDescription)
            }
            else {
                self!.performSegue(withIdentifier: "loggedIn", sender: nil)

            }
          // ...
        }
    }
    
    
}

