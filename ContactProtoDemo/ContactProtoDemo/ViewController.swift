//
//  ViewController.swift
//  ContactProtoDemo
//
//  Created by henry on 2023/8/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        RWService.shared.getCurrentUser { contact in
            guard let contact = contact else {
                return
            }
            print(contact.firstName);
            print(contact.lastName);
            print(contact.email);
        }
    }

}

