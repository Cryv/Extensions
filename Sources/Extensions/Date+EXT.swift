//
//  Date+EXT.swift
//  Figaccia Manager Rmk
//
//  Created by Alessio Longo on 04/05/25.
//

import Foundation

public extension Date {
    init(month: String) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        //        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate("MMMM")
        let date = formatter.date(from: month)
        
        self.init()
        self = date?.startOfMonth ?? Date()
    }
    
    init(month: String, year: String) {
        let formatter = DateFormatter()
        formatter.locale = Locale.autoupdatingCurrent
        formatter.dateFormat = "MMMM yyyy"  // expect full month name + year, e.g. "December 2024"
        
        let date = formatter.date(from: "\(month) \(year)")!
        
        // Normalize to start of month
        let comps = Calendar.current.dateComponents([.year, .month], from: date)
        self = Calendar.current.date(from: comps)?.startOfMonth ?? date
    }
    
    init(day: Int, month: Int, year: Int) {
        let date = Date()
        var components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        components.day = day
        components.month = month
        components.year = year
        
        self = Calendar.current.date(from: components) ?? Date()
    }
    
    init(date: Date, hour: Int, minute: Int? = 0) {
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: date)
        components.hour = hour
        components.minute = minute
        
        self = Calendar.current.date(from: components) ?? Date()
    }
    
    init(timeString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // 24-hour format
        formatter.locale = Locale(identifier: "en_US_POSIX")

        self = formatter.date(from: timeString) ?? Date()
    }
    
    var extendedStringDescription: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "IT-it")
        formatter.timeStyle = .none
        formatter.dateStyle = .full
        formatter.doesRelativeDateFormatting = false
        
        return formatter.string(from: self)
    }
    
    var relativeDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "it_IT")
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        
        return formatter.string(from: self)
    }
    
    var monthString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = .current
        formatter.setLocalizedDateFormatFromTemplate("MMMM")
        
        return formatter.string(from: self)
    }
    
    var yearString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.setLocalizedDateFormatFromTemplate("YYYY")
        let formattedDate = formatter.string(from: self)
        
        return formattedDate.firstUppercased
    }
    
    var shortYearString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.setLocalizedDateFormatFromTemplate("YY")
        let formattedDate = formatter.string(from: self)
        
        return formattedDate.firstUppercased
    }
    
    var shortDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "it_IT")
        return dateFormatter.string(from: self)
    }
    
    var dayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "it_IT")
        dateFormatter.dateFormat = "EEEE dd MMMM"
        
        return dateFormatter.string(from: self)
    }
    
    var shortDayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "it_IT")
        dateFormatter.dateFormat = "dd MMMM"
        
        return dateFormatter.string(from: self)
    }
    
    var hourInt: Int {
        let components = Calendar.current.dateComponents([.hour], from: self)
        
        return components.hour ?? 0
    }
    
    var dayInt: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "it_IT")
        dateFormatter.dateFormat = "dd"
        
        return Int(dateFormatter.string(from: self)) ?? 0
    }
    
    var timeString: String {
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: self)
        var minutes = String(calendar.component(.minute, from: self))
        
        if minutes.count == 1 {
            minutes = "0\(minutes)"
        }
        
        return "\(hour):\(minutes)"
    }
    
    var longTimeString: String {
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: self)
        var minutes = String(calendar.component(.minute, from: self))
        var seconds = String(calendar.component(.second, from: self))
        
        if minutes.count == 1 {
            minutes = "0\(minutes)"
        }
        
        if seconds.count == 1 {
            seconds = "0\(seconds)"
        }
        
        return "\(hour):\(minutes):\(seconds)"
    }
    
    var startOfDay: Date {
            return Calendar.current.startOfDay(for: self)
        }
    
    var endOfDay: Date {
            var components = DateComponents()
            components.day = 1
            components.second = -1
            return Calendar.current.date(byAdding: components, to: startOfDay) ?? Date()
        }
    
    var startOfMonth: Date {
        let calendar = Calendar(identifier: .gregorian)
        var components = calendar.dateComponents([.year, .month], from: self)
        let yearComponent = calendar.dateComponents([.year], from: self)
        components.year = yearComponent.year
        return calendar.date(from: components)?.startOfDay ?? Date().startOfDay
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.day = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)?.endOfDay ?? Date()
    }
    
    var daysInCurrentMonth: Int? {
        Calendar.current.range(of: .day, in: .month, for: self)?.count
    }
    
    var firstDayOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)!
    }
    
    var weekdayNumberStartingMonday: Int {
        let calendar = Calendar(identifier: .gregorian)
        var weekday = calendar.component(.weekday, from: self)
        weekday = (weekday + 5) % 7 + 1
        return weekday
    }
}
