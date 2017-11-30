//
//  ViewController.swift
//  PeopleFromOnlineExercises-ClassNotes
//
//  Created by C4Q  on 11/28/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contacts = [Contact]() {
        didSet {
            contacts.forEach{
                print($0.location.postCodeInt ?? "not int")
                print($0.location.postCodeStr ?? "not str")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactAPIClient.manager.getContacts(from: "https://randomuser.me/api/?results=500", completionHandler: {self.contacts = $0}, errorHandler: {print($0)})
    }

}

