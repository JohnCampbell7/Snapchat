//
//  SignInViewController.swift
//  Snapchat
//
//  Created by John Campbell on 19/09/2017.
//  Copyright © 2017 John Campbell. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("Hey we have an error:\(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password:  self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("Hey we have an error:\(error)")
                    } else {
                        print("Created user successfully")
                    }
                })
                
            } else {
                print("Signed in successfully")
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
        })
        
    }
    
    
}

