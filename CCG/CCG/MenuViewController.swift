//
//  ViewController.swift
//  CCG
//
//  Created by Matt Horst on 7/8/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .whiteColor()
        let width: CGFloat = 200
        let height: CGFloat = 200
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
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
    }

    func searchPressed(sender: UIButton) {
        print("SEARCH PRESSED")
    }

}

