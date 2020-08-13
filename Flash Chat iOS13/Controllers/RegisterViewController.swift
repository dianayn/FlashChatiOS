//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    init() {
        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let warningMessage = UILabel()
        warningMessage.translatesAutoresizingMaskIntoConstraints = false
        warningMessage.textAlignment = .center
        warningMessage.backgroundColor = .lightGray


        view.addSubview(warningMessage)
        
    }




    @IBAction func registerPressed(_ sender: UIButton) {

        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.warningMessage.text = e.localizedDescription
                    print(e.localizedDescription)
                } else {
                    // Navigate to the chatViewController
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }

}
