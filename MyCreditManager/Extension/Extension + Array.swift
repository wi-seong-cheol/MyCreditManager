//
//  Extension + Array.swift
//  MyCreditManager
//
//  Created by wi_seong on 2022/11/17.
//

import Foundation

extension Array {
    mutating func index(where condition: (Element) -> Bool) -> Int? {
        guard let index = firstIndex(where: condition) else {
            return nil
        }
        
        return index
    }
    
    mutating func remove(where condition: (Element) -> Bool) -> Element? {
        guard let index = firstIndex(where: condition) else {
            return nil
        }

        return remove(at: index)
    }
}
