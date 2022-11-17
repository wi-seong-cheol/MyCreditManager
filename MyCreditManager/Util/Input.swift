//
//  Input.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

class Input {
    func input(_ input: InputType) -> Any? {
        switch input {
        case .category:
            return category()
        case .addStudent:
            return inputSigle()
        case .deleteStudent:
            return inputSigle()
        case .addGrade:
            return inputMultiple(3)
        case .deleteGrade:
            return inputMultiple(2)
        case .average:
            return inputSigle()
        }
    }

    private func category() -> Int? {
        guard let input = readLine(),
              input != "" else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹의 X를 입력해주세요.")
            return nil
        }
        let op = input[input.startIndex]
        if op == "X" {
            print("프로그램을 종료합니다...")
            return 0
        }
        guard let intOperator = op.wholeNumberValue,
              intOperator > 0 && intOperator < 6 else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹의 X를 입력해주세요.")
            return nil
        }
        return intOperator
    }
    
    private func inputSigle() -> String? {
        let input = readLine()
        guard let input = input, input != "" else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        let data = input.components(separatedBy: " ")
        guard data.count == 1 else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        return input
    }
    
    private func inputMultiple(_ size: Int) -> [String]? {
        guard let input = readLine() else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        let data = input.components(separatedBy: " ")
        guard data.count == size, data[size - 1] != "" else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        return data
    }
}
