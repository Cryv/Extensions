//
//  File.swift
//  Extensions
//
//  Created by Alessio Longo on 16/10/25.
//

import Foundation

public extension Calendar {
    var weekdaySymbolsIT: [String] {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "it_IT") // lingua italiana

        let symbols = calendar.weekdaySymbols
        let first = calendar.firstWeekday - 1 // weekday è 1-based, array è 0-based
        return Array(symbols[first...] + symbols[..<first])
    }
}
