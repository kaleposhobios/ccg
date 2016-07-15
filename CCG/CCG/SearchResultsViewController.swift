//
//  SearchResultsViewController.swift
//  CCG
//
//  Created by Matt Horst on 7/15/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var searchString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greenColor()

        print("search string is \(searchString)")
    }
}
