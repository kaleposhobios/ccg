//
//  FakeNetworking.swift
//  CCG
//
//  Created by Matt Horst on 8/8/16.
//  Copyright © 2016 Truveris. All rights reserved.
//

import Foundation

struct FakeNetworking : Networking {
    func getClassroom(success: (classroom: Array<GroupModel>) -> Void,
                      failure: (error: String) -> Void) {
        // Set up our classroom
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            let smruti = StudentModel.createFemaleStudent("smruti")
            let helene = StudentModel(name: "Helene", gender: .Female)
            let patrick = StudentModel(name: "Patrick", gender: .Male)
            let hector = StudentModel(name: "Hector", gender: .Male)
            let alina = StudentModel(name: "Alina", gender: .Female)
            let matt = StudentModel(name: "Matt", gender: .Male)
            let absentGroup = GroupModel(name: "Absent", students: [smruti, helene, patrick])
            let presentGroup = GroupModel(name: "Present", students: [hector, alina, matt])
            success(classroom: [absentGroup, presentGroup])
        }
    }
}