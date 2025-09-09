//
//  String.swift
//  La Figaccia
//
//  Created by Cryv on 26/07/24.
//

import Foundation

extension String {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }

    var isEmail: Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    var intValue: Int? { Int(self) }
    
    func isStrongPassword(
        minLength: Int = 7,
        requiresUppercase: Bool = true,
        requiresLowercase: Bool = true,
        requiresNumber: Bool = true,
        requiresSpecialCharacter: Bool = true
    ) -> Bool {
        // Check minimum length
        guard self.count >= minLength else { return false }
        
        // Check for at least one uppercase letter
        if requiresUppercase && !self.contains(where: { $0.isUppercase }) {
            return false
        }
        
        // Check for at least one lowercase letter
        if requiresLowercase && !self.contains(where: { $0.isLowercase }) {
            return false
        }
        
        // Check for at least one numeric digit
        if requiresNumber && !self.contains(where: { $0.isNumber }) {
            return false
        }
        
        // Check for at least one special character
        if requiresSpecialCharacter {
            let specialCharacterSet = CharacterSet.punctuationCharacters.union(.symbols)
            if self.rangeOfCharacter(from: specialCharacterSet) == nil {
                return false
            }
        }
        
        return true
    }
    
    func clipped(maxCharacters: Int) -> String {
        String(prefix(maxCharacters))
    }
    
    func replaceSpacesWithUnderscores() -> String {
        self.replacingOccurrences(of: " ", with: "_")
    }
    
    static func convertToString(_ value: Any) -> String? {
        switch value {
        case let value as String:
            return value
        case let value as Int:
            return String(value)
        case let value as Double:
            return String(value)
        case let value as Float:
            return String(value)
        case let value as Bool:
            return String(value)
        case let value as Date:
            return value.formatted(date: .abbreviated, time: .shortened)
        case let array as [Any]:
            return array.compactMap({ String.convertToString($0) }).sorted().joined(separator: ", ")
        case let value as CustomStringConvertible:
            return value.description
        default:
            return nil
        }
    }
}

extension String {
    var stableHashValue: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(5381) { ($0 << 5) &+ $0 &+ Int($1) }
    }
}
