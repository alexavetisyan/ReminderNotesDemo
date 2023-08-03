//
//  ViewController.swift
//  ReminderNotesDemo
//
//  Created by 1 on 19.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    var timer = Timer()
    var time = 4
    var newFolderName1 = "New Folder"
    var newFolderName2 = "New Folder"
    var newFolderName3 = "New Folder"
    var howManyFolders = 0
    
    // MARK: - IBOutlets
    
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
        addTapAndLongPressGestures()
        foldersConfigurations()
    }
    
    // MARK: - IBActions
    
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
        howManyFolders += 1
        if newFolder1.isHidden == true {
            newFolder1.isHidden = false
        } else if newFolder2.isHidden == true {
            newFolder2.isHidden = false
        } else if newFolder3.isHidden == true {
            newFolder3.isHidden = false
        }
        if howManyFolders >= 4 {
            WarningLabel.isHidden = false
            timerFunc()
        }
    }
    
    // MARK: - @objc Functions
    
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
                if textField.text == "" {
                    self.newFolder1Text.text = "New Folder"
                }
                if textField.text == "" {
                    self.newFolder2Text.text = "New Folder"
                }
                if textField.text == "" {
                    self.newFolder3Text.text = "New Folder"
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
    @objc func timefunc() {
        time -= 1
        if time == 0 {
            timer.invalidate()
            WarningLabel.isHidden = true
            time = 4
        }
    }
    
    // MARK: - Function
    
    private func timerFunc() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timefunc),
                                     userInfo: nil,
                                     repeats: true)
    }
    private func addTapAndLongPressGestures(){
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
    }
    private func foldersConfigurations() {
        for item in collectionsOutlets {
            item.layer.cornerRadius = 15
        }
        newFolder1.isHidden = true
        newFolder2.isHidden = true
        newFolder3.isHidden = true
        WarningLabel.isHidden = true
    }}

