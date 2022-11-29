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

func showMenu() {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
}

func receiveUserInput() -> String? {
    return readLine()
}

while(!exit) {
    showMenu()
    guard let op = input.input(.menu) as? String else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
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
        exit = true
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

