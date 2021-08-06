//
//  LoginViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func onClick(_ sender: Any)
    {
        
    }
    var loginManager: LoginManager = LoginManager.instance
    
    
   
}
