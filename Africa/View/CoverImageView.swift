//
//  CoverImageView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI

struct CoverImageView: View {
    
    let arrCoverImages: [CoverImageModel] = AppUtils.shared.getCoverImagesData()
    
    var body: some View {
        TabView {
            ForEach(arrCoverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
        .frame(width: 400, height: 300)
}
