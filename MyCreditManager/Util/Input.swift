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
        case .menu:
            return inputMenu()
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
        case .exit:
            return Void()
        }
    }
    
    private func inputMenu() -> String? {
        return readLine()
    }
    
    private func inputSigle() -> String? {
        guard let data = readLine()?.components(separatedBy: " "),
              data.count == 1,
              data.first != "" else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        return data.first
    }
    
    private func inputMultiple(_ size: Int) -> [String]? {
        guard let data = readLine()?.components(separatedBy: " "),
              data.count == size,
              data[size - 1] != "" else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return nil
        }
        return data
    }
}
