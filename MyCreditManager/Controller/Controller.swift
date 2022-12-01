//
//  Controller.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/12/02.
//

import Foundation

class Controller {
    private let category: Category = Category()
    private let input: Input = Input()
    
    func run() {
        while(true) {
            Output.Print.showMenu()
            guard let op = input.input(.menu) as? String else {
                Output.Print.categoryInputError()
                break
            }
            
            switch op {
            case "1":
                category.type(.addStudent)
            case "2":
                category.type(.deleteStudent)
            case "3":
                category.type(.addGrade)
            case "4":
                category.type(.deleteGrade)
            case "5":
                category.type(.average)
            case "X":
                category.type(.exit)
                return
            default:
                Output.Print.categoryInputError()
            }
        }
    }
}
