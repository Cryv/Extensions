//
//  View.swift
//  La Figaccia
//
//  Created by Cryv on 22/07/24.
//

import SwiftUI

extension View {
    func poppinsFont(weight: Font.Weight = .regular, size: CGFloat = 16) -> some View {
        return font(.custom("Poppins-Regular", size: size))
            .fontWeight(weight)
    }
}
