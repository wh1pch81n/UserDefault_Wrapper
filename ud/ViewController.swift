//
//  ViewController.swift
//  ud
//
//  Created by Derrick Ho on 6/28/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

import UIKit

// Base class that all user defaults inherit from
class MyUserDefaults: NSObject {
    public let suiteName: String
    public let user_default: UserDefaults
    init(suiteName: String) {
        self.suiteName = suiteName
        user_default = UserDefaults(suiteName: suiteName)!
    }
    
    func removeSuite() {
        user_default.removeSuite(named: suiteName)
    }
    
}

// Bundle specific.
class BundleUserDefaults: MyUserDefaults {
    // includes a shared static property with the suiteName the same as the class name
    static let shared = BundleUserDefaults(suiteName: "BundleUserDefaults")
    
    // accessor methods. Use of #function assumes the string "m"
    var m: String {
        get { return user_default.string(forKey: #function) ?? "" }
        set { user_default.set(newValue, forKey: #function) }
    }
    
    var x: Int {
        get { return user_default.integer(forKey: #function) }
        set { user_default.set(newValue, forKey: #function) }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BundleUserDefaults.shared.m = "cat"
        
        var path: [AnyObject] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) as [AnyObject]
        let folder: String = path[0] as! String
        print("Your NSUserDefaults are stored in this folder: \(folder)/Preferences")
        print("")
        print("\(BundleUserDefaults.shared.suiteName).plist")
    }
    
}

