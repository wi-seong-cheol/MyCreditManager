//
//  Output.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/12/01.
//

import Foundation

enum Output {
    enum Print {
        // MARK: Menu
        static func showMenu() {
            print("원하는 기능을 입력해주세요")
            print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        }
        
        // MARK: Input
        static func categoryInputError() {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
        
        // MARK: Add Student
        static func inputAppendStudentInformation() {
            print("추가할 학생의 이름을 입력해주세요")
        }
        
        static func appendStudent(_ name: String) {
            print("\(name) 학생을 추가했습니다.")
        }
        
        // MARK: Delete Student
        static func inputDeleteStudentInformation() {
            print("삭제할 학생의 이름을 입력해주세요")
        }
        
        static func deleteStudent(_ name: String) {
            print("\(name) 학생을 삭제했습니다.")
        }
        
        // MARK: Add Grade
        static func inputAppendGradeInformation() {
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift A+")
            print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        }
        
        static func appendGrade(_ name: String, _ title: String, _ grade: String) {
            print("\(name) 학생의 \(title) 과목이 \(grade)로 추가(변경)되었습니다.")
        }
        
        // MARK: Delete Grade
        static func inputDeleteGradeInformation() {
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift")
        }
        
        static func deleteGrade(_ name: String, _ title: String) {
            print("\(name) 학생의 \(title) 과목의 성적이 삭제되었습니다.")
        }
        
        // MARK: Average
        static func inputAverageInformation() {
            print("평점을 알고싶은 학생의 이름을 입력해주세요")
        }
        
        static func averageGrade(_ title: String, _ grade: String) {
            print("\(title): \(grade)")
        }
        
        static func average(_ value: String) {
            print(value)
        }
        
        // MARK: Exit
        static func exit() {
            print("프로그램을 종료합니다...")
        }
        
        // MARK: Erorr
        static func inputError() {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
        
        static func alreadyExist(_ name: String) {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
        
        static func isNotFoundStudent(_ name: String) {
            print("\(name) 학생을 찾지 못했습니다.")
        }
        
        static func isNotFoundGrade() {
            print("해당 성적을 찾지 못했습니다.")
        }
    }
}
