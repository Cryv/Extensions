//
//  File.swift
//  Extensions
//
//  Created by Alessio Longo on 15/10/25.
//

import Foundation

public extension Data {
    func prettyPrint() {
        do {
            let object = try JSONSerialization.jsonObject(with: self, options: [])
            let prettyData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            if let prettyString = String(data: prettyData, encoding: .utf8) {
                print("📦 Response Body (pretty):\n\(prettyString)")
            }
        } catch {
            print("❌ Failed to pretty print JSON: \(error)")
        }
    }
}
