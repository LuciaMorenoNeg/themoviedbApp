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
    
   /* @IBAction func signin(_ sender: Any) {
        if verifyLoginData() {
            APIClient.shared.request(request: APIRouteOptions.requestToken) { <#APIClient.APIResult#> in
                
            }
        }
    }
    func verifyLoginData() -> Bool{
        if user.text == "" || password.text == "" {
            return false
        }
        return true
    }
 */
}
