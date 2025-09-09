//
//  Error+EXT.swift
//  La Figaccia
//
//  Created by Alessio Longo on 21/01/25.
//

import Foundation

extension Error {
    var eventParameters: [String: Any] {
        [
            "error_description": localizedDescription
        ]
    }
}
