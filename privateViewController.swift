//
//  privateViewController.swift
//  ReminderNotesDemo
//
//  Created by 1 on 21.07.23.
//

import UIKit

class privateViewController: UIViewController {
    
    let password1 = "1234"
    
    @IBOutlet weak var loginOutlet: UIButton!
    
   @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "TableViewController1") as? UITableViewController else { return }
        
        
        
        if password.text == password1 {
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
