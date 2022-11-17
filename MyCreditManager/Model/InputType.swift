//
//  InputType.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

enum InputType: Int, CaseIterable {
    case category
    case addStudent
    case deleteStudent
    case addGrade
    case deleteGrade
    case average
    
    var kind: String {
        String(describing: self)
    }
}
