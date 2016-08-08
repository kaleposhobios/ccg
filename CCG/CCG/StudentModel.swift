//
//  StudentModel.swift
//  CCG
//
//  Created by Matt Horst on 8/8/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import Foundation

enum Gender {
    case Male
    case Female
}

struct StudentModel {
    var name: String
    var gender: Gender

    static func createFemaleStudent(name: String, gender: Gender = .Female) -> StudentModel {
        return StudentModel(name: name, gender: gender)
    }

}

