//
//  InputType.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

enum InputType: Int, CaseIterable {
    case menu
    case addStudent
    case deleteStudent
    case addGrade
    case deleteGrade
    case average
    case exit
    
    var kind: String {
        String(describing: self)
    }
}
