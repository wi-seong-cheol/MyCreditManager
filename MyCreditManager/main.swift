//
//  main.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

let input: Input = Input()
let category: Category = Category()
var exit: Bool = false

while(!exit) {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    guard let op = input.input(.category) as? Int else {
        continue
    }
    switch op {
    case 0:
        exit = true
        break
    case 1:
        category.type(.addStudent)
        break
    case 2:
        category.type(.deleteStudent)
        break
    case 3:
        category.type(.addGrade)
        break
    case 4:
        category.type(.deleteGrade)
        break
    case 5:
        category.type(.average)
        break
    default:
        break
    }
}
