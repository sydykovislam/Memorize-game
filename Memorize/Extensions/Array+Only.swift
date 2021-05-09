//
//  Array+Only.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/13/21.
//

import Foundation

extension Array {
    var only :Element? {
        self.count == 1 ? first : nil
    }
}
