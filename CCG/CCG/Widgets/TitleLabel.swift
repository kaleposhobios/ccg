//
//  TitleLabel.swift
//  CCG
//
//  Created by Matt Horst on 7/8/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import UIKit

class TitleLabel : UILabel {

    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.text = title
        textColor = .blackColor()
        lineBreakMode = .ByWordWrapping
        numberOfLines = 0
        textAlignment = .Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}