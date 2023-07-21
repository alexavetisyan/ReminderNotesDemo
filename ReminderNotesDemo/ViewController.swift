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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
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

