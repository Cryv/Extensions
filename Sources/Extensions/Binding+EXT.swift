//
//  File.swift
//  Extensions
//
//  Created by Alessio Longo on 15/10/25.
//

import SwiftUI

public extension Binding {
    static func convert(_ intBinding: Binding<Int>) -> Binding<String> {
        Binding<String>(
            get: { String(intBinding.wrappedValue) },
            set: { newValue in
                if let intValue = Int(newValue) {
                    intBinding.wrappedValue = intValue
                }
            }
        )
    }

    /// Converte un `Binding<String>` in un `Binding<Int>`.
    static func convert(_ stringBinding: Binding<String>) -> Binding<Int> {
        Binding<Int>(
            get: { Int(stringBinding.wrappedValue) ?? 0 },
            set: { stringBinding.wrappedValue = String($0) }
        )
    }
    
    static func convert<TInt: Sendable, TFloat: Sendable>(_ intBinding: Binding<TInt>) -> Binding<TFloat>
    where TInt:   BinaryInteger,
          TFloat: BinaryFloatingPoint{

        Binding<TFloat> (
            get: { TFloat(intBinding.wrappedValue) },
            set: { intBinding.wrappedValue = TInt($0) }
        )
    }

    static func convert<TFloat: Sendable, TInt: Sendable>(_ floatBinding: Binding<TFloat>) -> Binding<TInt>
    where TFloat: BinaryFloatingPoint,
          TInt:   BinaryInteger {

        Binding<TInt> (
            get: { TInt(floatBinding.wrappedValue) },
            set: { floatBinding.wrappedValue = TFloat($0) }
        )
    }
}
