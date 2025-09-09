//
//  Double.swift
//  La Figaccia
//
//  Created by Alessio Longo on 11/02/25.
//

import Foundation

extension Double {
    var twoPointString: String {
        return String(format: "%.2f", self)
    }
    
    var twoPointStringTruncated: String {
        let truncated = Double(Int(self * 100)) / 100
        return String(format: "%.2f", truncated)
    }
    
    var localizedPrice: String {
        return self.formatted(.currency(code: "EUR"))
    }
    
    var localizedDouble: String {
        return self.formatted(.number)
    }
}
