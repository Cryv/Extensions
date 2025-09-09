//
//  Dictionary+EXT.swift
//  La Figaccia
//
//  Created by Alessio Longo on 21/01/25.
//

import Foundation

public extension Dictionary where Key == String {
    mutating func first(upTo maxItems: Int) {
        var counter: Int = 0
        for (key, _) in self {
            if counter >= maxItems {
                removeValue(forKey: key)
            } else {
                counter += 1
            }
        }
    }
    
    func mergeByKeepingOriginal(with dictionary: Dictionary) -> [String: Any] {
        self.merging(dictionary) { current, _ in current }
    }
}
