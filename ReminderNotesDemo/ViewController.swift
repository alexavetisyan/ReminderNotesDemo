//
//  ViewController.swift
//  ReminderNotesDemo
//
//  Created by 1 on 19.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var time = 4
    var newFolderName1 = "New Folder"
    var newFolderName2 = "New Folder"
    var newFolderName3 = "New Folder"
    
    func xxx() {
        
        time -= 1
        if newFolder3.isHidden == false {
            WarningLabel.isHidden = false
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timefunc),
                                     userInfo: nil,
                                     repeats: true)
    }
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let alertController = UIAlertController(title: "Change the name of your folder", message: nil, preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Write new name"
            }
            let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                guard let self = self, let textField = alertController.textFields?.first else { return }
                if sender.view == self.newFolder1 {
                    self.newFolder1Text.text = textField.text ?? "New Folder"
                } else if sender.view == self.newFolder2 {
                    self.newFolder2Text.text = textField.text ?? "New Folder"
                } else if sender.view == self.newFolder3 {
                    self.newFolder3Text.text = textField.text ?? "New Folder"
                }
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    @objc func handleTapGesture(_ sender:UITapGestureRecognizer){
        let commonTableViewController = CommonTableViewController()
        commonTableViewController.modalPresentationStyle = .fullScreen
        present(commonTableViewController, animated: true, completion: nil)
    }
    
    @IBOutlet var collectionsOutlets: [UIView]!
    @IBOutlet weak var WarningLabel: UILabel!
    @IBOutlet weak var searchOutlet: UITextField!
    @IBOutlet weak var TodayTask: UIView!
    @IBOutlet weak var ScheduledOutlet: UIView!
    @IBOutlet weak var AllOutlet: UIView!
    @IBOutlet weak var CompletedOutlet: UIView!
    @IBOutlet weak var PrivateOutlet: UIView!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var newFolder1: UIView!
    @IBOutlet weak var newFolder2: UIView!
    @IBOutlet weak var newFolder3: UIView!
    @IBOutlet weak var newFolder1Text: UILabel!
    @IBOutlet weak var newFolder2Text: UILabel!
    @IBOutlet weak var newFolder3Text: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        TodayTask.addGestureRecognizer(tapGesture)
        for view in collectionsOutlets {
            view.addGestureRecognizer(tapGesture)
        }
        let longPress1 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        newFolder1.addGestureRecognizer(longPress1)

        let longPress2 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        newFolder2.addGestureRecognizer(longPress2)

        let longPress3 = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        newFolder3.addGestureRecognizer(longPress3)
        
        TodayTask.layer.cornerRadius = 15
        ScheduledOutlet.layer.cornerRadius = 15
        AllOutlet.layer.cornerRadius = 15
        CompletedOutlet.layer.cornerRadius = 15
        PrivateOutlet.layer.cornerRadius = 15
        newFolder1.layer.cornerRadius = 15
        newFolder2.layer.cornerRadius = 15
        newFolder3.layer.cornerRadius = 15
        newFolder1.isHidden = true
        newFolder2.isHidden = true
        newFolder3.isHidden = true
        WarningLabel.isHidden = true

    }
    @IBAction func todayAction(_ sender: Any) {
    }
    @IBAction func scheduledAction(_ sender: Any) {
    }
    @IBAction func allAction(_ sender: Any) {
    }
    @IBAction func completedAction(_ sender: Any) {
    }
    @IBAction func privateAction(_ sender: Any) {
        
    }
    
    
    @IBAction func tapGestureAction(_ sender: Any) {
        let commonTableViewController = CommonTableViewController()
        commonTableViewController.modalPresentationStyle = .fullScreen
        present(commonTableViewController, animated: true, completion: nil)
    }
    
    @IBAction func addAction(_ sender: Any) {
        if newFolder1.isHidden == true {
            newFolder1.isHidden = false
        } else if newFolder2.isHidden == true {
            newFolder2.isHidden = false
        } else if newFolder3.isHidden == true {
            newFolder3.isHidden = false
        }
        if collectionsOutlets.last?.isHidden == false {
            WarningLabel.isHidden = false
        }
        
        xxx()
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        if WarningLabel.isHidden == false {
            timefunc()
        }
    }
    
    @objc func timefunc() {
        time -= 1
        if time == 0 {
            timer.invalidate()
        }
        
        if time == 0 {
            WarningLabel.isHidden = false
        }
        if WarningLabel.isHidden == false {
            WarningLabel.isHidden = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        xxx()
        
    }
}

