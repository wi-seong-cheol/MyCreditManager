//
//  Grade.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

enum Grade: Float, CaseIterable {
    case AP = 4.5
    case A = 4
    case BP = 3.5
    case B = 3
    case CP = 2.5
    case C = 2
    case DP = 1.5
    case D = 1
    case F = 0
    
    var kind: String {
        switch self {
        case .AP:
            return "A+"
        case .A:
            return "A"
        case .BP:
            return "B+"
        case .B:
            return "B"
        case .CP:
            return "C+"
        case .C:
            return "C"
        case .DP:
            return "D+"
        case .D:
            return "D"
        case .F:
            return "F"
        }
    }
}
