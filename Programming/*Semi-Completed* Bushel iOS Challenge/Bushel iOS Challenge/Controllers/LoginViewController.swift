//
//  ViewController.swift
//  Bushel iOS Challenge
//
//  Created by Jack Maring on 2/11/20.
//  Copyright © 2020 Jack Maring. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
       
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let headers: HTTPHeaders = [
//            .authorization(username: "test@email.com", password: "testpassword"),
//            .accept("application/json")
//        ]
//
//        let parameters = ["category": "Movies", "genre": "Action"]
//
//        AF.request("https://httpbin.org/headers", parameters: parameters, headers: headers).responseJSON { response in
//            debugPrint(response)
//        }
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let parameters = ["Username": usernameTextField.text, "Password": passwordTextField.text]
        
        AF.request("https://challenge.myriadapps.com/api/v1/login", method: .post, parameters: parameters)
        .responseJSON { response in
//            print(response.value!)
        }
        
        shouldPerformSegue(withIdentifier: K.loginSegue, sender: self)
    }
    
    
}

