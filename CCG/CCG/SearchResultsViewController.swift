//
//  SearchResultsViewController.swift
//  CCG
//
//  Created by Matt Horst on 7/15/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource {


    var searchString: String?

    let classroom: [String: Array<String>] = [
        "absentPeople": ["Hector", "Helene", "Bo"],
        "presentPeople": ["Matt", "Alina", "Andy"]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greenColor()

        print("search string is \(searchString)")

        // Make a table view

        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.backgroundColor = .whiteColor()
        tableView.dataSource = self
        view.addSubview(tableView)

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SearchResultCell")

        // Implement data source and delegate methods

        // Return basic table view cell with fake data

        // Refactor data to model class

        // Do a pretend network call.
    }


    // Mark: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: get the number of rows for the given key
        return 0
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return classroom.keys.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell", forIndexPath: indexPath)
        cell.backgroundColor = .redColor()
        if let label = cell.textLabel {
            // Get the person's name based on the given index path. indexPath.section is which array to use in the dictioanry,
            // indexpath.row is which item in the array to use.
            label.text = "TODO"
        }
        return cell
    }

}


