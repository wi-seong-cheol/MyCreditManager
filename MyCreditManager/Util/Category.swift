//
//  Category.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

private var students: [Student] = []

class Category {
    func type(_ input: InputType) {
        switch input {
        case .addStudent:
            return addStudent()
        case .deleteStudent:
            return deleteStudent()
        case .addGrade:
            return addGrade()
        case .deleteGrade:
            return deleteGrade()
        case .average:
            return average()
        case .exit:
            return exit()
        }
    }
    
    private func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        guard let name = input.input(.addStudent) as? String else {
            return
        }
        if containStudent(name) {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            students.append(Student(name: name))
            print("\(name) 학생을 추가했습니다.")
        }
    }
    
    private func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        guard let name = input.input(.deleteStudent) as? String else {
            return
        }
        if let idx = students.firstIndex(where: {$0.name == name}) {
            students.remove(at: idx)
            print("\(name) 학생을 삭제했습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    private func addGrade() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        guard let data = input.input(.addGrade) as? [String] else {
            return
        }
        
        let name = data[0]
        let title = data[1]
        let grade = data[2]
        var gradeEnum: Grade!
        var isGrade: Bool = false
        Grade.allCases.forEach {
            if $0.kind == grade {
                isGrade = true
                gradeEnum = $0
            }
        }
        if !isGrade {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        if !containStudent(name) {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        if let idx = students.firstIndex(where: {$0.name == name}) {
            guard let subjectIdx = students[idx].subjects.index(where: { $0.title == title }) else {
                students[idx].subjects.append(Subject(title: title, grade: gradeEnum))
                print("\(name) 학생의 \(title) 과목이 \(grade)로 추가(변경)되었습니다.")
                return
            }
            students[idx].subjects[subjectIdx].grade = gradeEnum
            print("\(name) 학생의 \(title) 과목이 \(grade)로 추가(변경)되었습니다.")
        }
    }
    
    private func deleteGrade() {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift")
        
        guard let data = input.input(.deleteGrade) as? [String] else {
            return
        }
        let name = data[0]
        let title = data[1]
    
        if !containStudent(name) {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        
        if let idx = students.firstIndex(where: {$0.name == name}) {
            guard let element = students[idx].subjects.remove(where: { $0.title == title }) else {
                print("해당 성적을 찾지 못했습니다.")
                return
            }
            print("\(name) 학생의 \(element.title) 과목의 성적이 삭제되었습니다.")
        }
    }
    
    private func average() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        guard let name = input.input(.average) as? String else {
            return
        }
    
        if !containStudent(name) {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        if let idx = students.firstIndex(where: {$0.name == name}) {
            
            if students[idx].subjects.count == 0 {
                print("성적이 없습니다.")
                return
            }
            var sum: Float = 0
            for subject in students[idx].subjects {
                print("\(subject.title): \(subject.grade.kind)")
                sum += subject.grade.rawValue
            }
            
            let avg = String(sum / Float(students[idx].subjects.count))
            
            guard let average = Decimal(string: avg)?.averageString else {
                return
            }
            print(average)
        }
    }
    
    private func containStudent(_ name: String) -> Bool {
        if students.filter({ $0.name == name }).count > 0 {
            return true
        } else {
            return false
        }
    }
    
    private func exit() {
        print("프로그램을 종료합니다...")
    }
}
