//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
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
        warningMessage.numberOfLines = 1

        view.addSubview(warningMessage)
        warningMessage.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.centerY.equalTo(100)
            $0.leftMargin.equalToSuperview().offset(5)
            $0.bottom.centerY.equalToSuperview()
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
