//
//  Networking.swift
//  CCG
//
//  Created by Matt Horst on 8/8/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import Foundation

protocol Networking {
    func getClassroom(success: (classroom: Array<GroupModel>) -> Void,
                      failure: (error: String) -> Void)
}