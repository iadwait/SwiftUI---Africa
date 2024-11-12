//
//  CenterModifier.swift
//  Africa
//
//  Created by Adwait Barkale on 11/11/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
