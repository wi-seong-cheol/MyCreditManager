//
//  Category.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

class Category {
    private var students: [Student] = []
    private let input: Input = Input()
    
    func type(_ input: InputType) {
        switch input {
        case .menu:
            return
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
        Output.Print.inputAppendStudentInformation()
        guard let name = input.input(.addStudent) as? String else {
            return
        }
        
        guard false == containStudent(name) else {
            Output.Print.alreadyExist(name)
            return
        }
        students.append(Student(name: name))
        Output.Print.appendStudent(name)
    }
    
    private func deleteStudent() {
        Output.Print.inputDeleteStudentInformation()
        guard let name = input.input(.deleteStudent) as? String else {
            return
        }
        guard let idx = students.firstIndex(where: {$0.name == name}) else {
            Output.Print.isNotFoundStudent(name)
            return
        }
        students.remove(at: idx)
        Output.Print.deleteStudent(name)
    }
    
    private func addGrade() {
        Output.Print.inputAppendGradeInformation()
        guard let data = input.input(.addGrade) as? [String] else {
            return
        }
        
        let name = data[0]
        let title = data[1]
        let grade = data[2]
        
        guard let _ = students.firstIndex(where: {$0.name == name}) else {
            Output.Print.isNotFoundStudent(name)
            return
        }
        guard let gradeEnum = Grade.allCases.filter({ $0.kind == grade }).first else {
            Output.Print.inputError()
            return
        }
        guard let idx = students.firstIndex(where: {$0.name == name}) else {
            return
        }
        guard let subjectIdx = students[idx].subjects.index(where: { $0.title == title }) else {
            students[idx].subjects.append(Subject(title: title, grade: gradeEnum))
            Output.Print.appendGrade(name, title, grade)
            return
        }
        students[idx].subjects[subjectIdx].grade = gradeEnum
        Output.Print.appendGrade(name, title, grade)
    }
    
    private func deleteGrade() {
        Output.Print.inputDeleteGradeInformation()
        
        guard let data = input.input(.deleteGrade) as? [String] else {
            return
        }
        let name = data[0]
        let title = data[1]
        
        guard let idx = students.firstIndex(where: {$0.name == name}) else {
            Output.Print.isNotFoundStudent(name)
            return
        }
        guard let element = students[idx].subjects.remove(where: { $0.title == title }) else {
            Output.Print.isNotFoundGrade()
            return
        }
        Output.Print.deleteGrade(name, element.title)
    }
    
    private func average() {
        Output.Print.inputAverageInformation()
        guard let name = input.input(.average) as? String else {
            return
        }
        
        guard let idx = students.firstIndex(where: {$0.name == name}) else {
            Output.Print.isNotFoundStudent(name)
            return
        }
        if students[idx].subjects.count == 0 {
            Output.Print.isNotFoundGrade()
            return
        }
        var sum: Float = 0
        for subject in students[idx].subjects {
            Output.Print.averageGrade(subject.title, subject.grade.kind)
            sum += subject.grade.rawValue
        }
        
        let avg = String(sum / Float(students[idx].subjects.count))
        
        guard let average = Decimal(string: avg)?.averageString else {
            return
        }
        Output.Print.average(average)
    }
    
    private func exit() {
        Output.Print.exit()
    }
    
    private func containStudent(_ name: String) -> Bool {
        return students.filter({ $0.name == name }).count > 0
    }
}
