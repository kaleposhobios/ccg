//
//  ViewController.swift
//  CCG
//
//  Created by Matt Horst on 7/8/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController {


    var button1: UIButton?
    var searchField: UITextField?

    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = .whiteColor()
        let width: CGFloat = 200
        let height: CGFloat = 200
        let frame = CGRect(x: ((view.frame.size.width - width) / 2),
                           y: 0,
                           width:
            width, height: height)
        let titleLabel: TitleLabel = TitleLabel(
            frame: frame,
            title: "Truveris - The CCG")
        view.addSubview(titleLabel)

        var frame2 = frame
        frame2.origin.y = frame.origin.y + frame.size.height
        let subTitleLabel: TitleLabel = TitleLabel(
            frame: frame2,
            title: "The most excellent game")
        view.addSubview(subTitleLabel)

        let searchButton = UIButton(type: .System)
        var frame3 = frame
        frame3.origin.y = frame2.origin.y + frame2.size.height
        searchButton.frame = frame3
        searchButton.setTitle("Search", forState: .Normal)
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(searchPressed(_:)), forControlEvents: .TouchUpInside)

        var frame4 = frame
        frame4.origin.y = frame3.origin.y + frame3.size.height
        frame4.size.height = 60
        searchField = UITextField(frame: frame4)
        searchField?.borderStyle = .RoundedRect
        view.addSubview(searchField!)
    }

    func searchPressed(sender: UIButton) {
        if let nav = self.navigationController, string = searchField?.text {
            let searchViewController = SearchResultsViewController()
            searchViewController.searchString = string
            nav.pushViewController(searchViewController, animated: true)
        } else {
            fatalError("nothing is gonna happen you probably wanna fix it")
        }
    }

}

