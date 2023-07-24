//
//  CommonTableViewController.swift
//  ReminderNotesDemo
//
//  Created by appler on 24.07.23.
//

import UIKit

class CommonTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // First Line
        let Title = UILabel()
        Title.text = "Title"
        Title.font = UIFont.boldSystemFont(ofSize: 18)
        cell.contentView.addSubview(Title)
        Title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Title.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            Title.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
        ])
        
        // Second Line
        let Description = UILabel()
        Description.text = "Description"
        Description.font = UIFont.systemFont(ofSize: 16)
        cell.contentView.addSubview(Description)
        Description.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Description.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            Description.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 8),
        ])

        return cell
    }

}
