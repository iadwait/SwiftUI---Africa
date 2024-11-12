//
//  CopyrightsView.swift
//  Africa
//
//  Created by Adwait Barkale on 11/11/24.
//

import SwiftUI

struct CopyrightsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright @ Adwait Barkale
    All right reserved
    Better Apps Less Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CopyrightsView()
}
