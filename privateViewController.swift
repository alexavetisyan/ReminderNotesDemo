//
//  privateViewController.swift
//  ReminderNotesDemo
//
//  Created by 1 on 21.07.23.
//

import UIKit

class privateViewController: UIViewController {
    
    // Key to use for saving the password in UserDefaults
    let passwordKey = "SavedPassword"
    
    var isPasswordSet: Bool {
        return UserDefaults.standard.string(forKey: passwordKey) != nil
    }
    
    @IBOutlet weak var loginOutlet: UIButton!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "TableViewController1") as? UITableViewController else { return }
        print("ok")
        // Check if the entered password matches the saved password
        if password.text == getPasswordFromUserDefaults() {
            navigationController?.pushViewController(vc, animated: false)
            
        } else {
            // Handle incorrect password scenario (e.g., show an alert)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if a password has been set in UserDefaults
        if isPasswordSet {
            loginOutlet.setTitle("OK", for: .normal)
        } else {
            loginOutlet.setTitle("Create Password", for: .normal)
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if !isPasswordSet {
            setPasswordToUserDefaults(password.text)
            loginOutlet.setTitle("OK", for: .normal)
        }
    }
    
    // Helper function to get the password from UserDefaults
    func getPasswordFromUserDefaults() -> String? {
        return UserDefaults.standard.string(forKey: passwordKey)
    }
    
    // Helper function to set the password to UserDefaults
    func setPasswordToUserDefaults(_ password: String?) {
        UserDefaults.standard.set(password, forKey: passwordKey)
    }
}
