//
//  SearchResultsViewController.swift
//  CCG
//
//  Created by Matt Horst on 7/15/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var classRoom: Array<GroupModel>?

    var searchString: String?
    let activityIndicator = UIActivityIndicatorView(frame: CGRect.zero)
    var networking: Networking = FakeNetworking()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()

        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.backgroundColor = .whiteColor()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        activityIndicator.frame = self.view.bounds
        activityIndicator.activityIndicatorViewStyle = .Gray
        view.addSubview(activityIndicator)

        tableView.alpha = 0
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SearchResultCell")

        activityIndicator.startAnimating()
        networking.getClassroom({ (classroom) in
            // store the data
            self.classRoom = classroom
            // reload the data
            tableView.reloadData()

            // animate the change
            UIView.animateWithDuration(1, animations: {
                self.activityIndicator.alpha = 0
                tableView.alpha = 1
                }, completion: { (completed) in
                    self.activityIndicator.stopAnimating()
            })
            }) { (error) in
                // TODO: show an alert view
        }
    }


    // Mark: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myClassroom = self.classRoom {
            return myClassroom[section].students.count
        }

        return 0
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let myClassroom = self.classRoom {
            return myClassroom.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell", forIndexPath: indexPath)
        if let label = cell.textLabel {
            if let student = getStudent(indexPath) {
                label.text = student.name
                switch student.gender {
                case Gender.Female:
                    label.textColor = .redColor()
                default:
                    label.textColor = .blueColor()
                }
            }

        }
        return cell
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let myClassroom = self.classRoom {
            let group = myClassroom[section]
            return group.name
        }
        return nil
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let student = getStudent(indexPath) {
            print("student selected is \(student.name)")
            let detailsVC = UIViewController(nibName: nil, bundle: nil)
            navigationController?.pushViewController(detailsVC, animated: true)
        }

    }

    private func getStudent(indexPath: NSIndexPath) -> StudentModel? {
        if let myClassroom = self.classRoom {
            let student = myClassroom[indexPath.section].students[indexPath.row]
            return student
        }
        return nil
    }
}


