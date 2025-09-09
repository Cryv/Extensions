//
//  Encodable.swift
//  La Figaccia
//
//  Created by Cryv on 26/07/24.
//

import Foundation

public extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        guard let dict = jsonObject as? [String: Any] else {
            throw NSError(domain: "SerializationError", code: 0, userInfo: nil)
        }
        return dict
    }
}

