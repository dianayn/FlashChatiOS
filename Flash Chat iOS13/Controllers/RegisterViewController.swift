//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SnapKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    init() {
        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    let warningMessage = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        warningMessage.translatesAutoresizingMaskIntoConstraints = false
        warningMessage.textAlignment = .center
        warningMessage.textColor = .red
        warningMessage.numberOfLines = 0

        view.addSubview(warningMessage)

        warningMessage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        }
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
