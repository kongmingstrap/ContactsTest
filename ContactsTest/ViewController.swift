//
//  ViewController.swift
//  ContactsTest
//
//  Created by Takaaki Tanaka on 2015/10/12.
//  Copyright © 2015年 Takaaki Tanaka. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let status = CNContactStore.authorizationStatusForEntityType(.Contacts)
        
        switch status {
        case .NotDetermined:
            print("status: NotDetermined")
        case .Restricted:
            print("status: Restricted")
        case .Denied:
            print("status: Denied")
        case .Authorized:
            print("status: Authorized")
        }
        /*! The user has not yet made a choice regarding whether the application may access contact data. */
        //case NotDetermined
        /*! The application is not authorized to access contact data.
        *  The user cannot change this application’s status, possibly due to active restrictions such as parental controls being in place. */
        //case Restricted
        /*! The user explicitly denied access to contact data for the application. */
        //case Denied
        /*! The application is authorized to access contact data. */
        //case Authorized
        
        let store = CNContactStore()
        
        store.requestAccessForEntityType(.Contacts, completionHandler:{ (granted: Bool, error: NSError?) -> Void in
            print("granted: \(granted)")
        })
        
        //[CNContactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

