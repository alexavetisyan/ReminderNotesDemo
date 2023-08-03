//
//  TableViewController1.swift
//  ReminderNotesDemo
//
//  Created by appler on 03.08.23.
//

import UIKit

class TableViewController1: UITableViewController {
    var names = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tintColor = .darkGray
        title = "My Private Folder"
        tableView.backgroundView?.backgroundColor = .darkGray
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
          return cell
      }

}
