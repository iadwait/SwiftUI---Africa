//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Adwait Barkale on 07/11/24.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: LocationModel
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            
            // Apply Border feel to Image
//            Circle()
//                .fill(.accent)
//                .frame(width: 54, height: 54, alignment: .center)
            
            // Animation from Scale 1.0 to 2.0 with duration of 2 Seconds
            Circle()
                .stroke()
                .fill(.accent)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            // Image
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.accentColor, lineWidth: 2.0))
        }
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        })
    }
    
}

//#Preview {
//    MapAnnotationView()
//}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let arrLocations: [LocationModel] = AppUtils.shared.getLocationData()
            MapAnnotationView(location: arrLocations[0])
        }
    }
}
