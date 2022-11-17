//
//  Student.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

struct Student {
    let name: String
    var subjects: [Subject]
    
    init(name: String) {
        self.name = name
        self.subjects = []
    }
}
