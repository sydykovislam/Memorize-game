//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/12/21.
//

import Foundation

extension Array where Element :Identifiable {
    func getFirstIndex(matching :Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id {
                return index
            }
        }
        return nil
    }
}
