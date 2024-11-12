//
//  GalleryView.swift
//  Africa
//
//  Created by Adwait Barkale on 04/11/24.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedImage = "lion"
    let animals: [AnimalModel] = AppUtils.shared.getAnimalsData()
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Simple GRID Definition
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // Effective Grid Definition
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic Grid Layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center ,spacing: 30) {
                
                // Selected Image
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) {
                        gridSwitch()
                    }
                
                // GRID
                LazyVGrid(columns: gridLayout, alignment: .center,spacing: 10 , content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2.0)) // User overlay for borner instead of ZStack and new circle so frame does not matter
                            .onTapGesture { // Alternative can be using a Button
                                selectedImage = item.image
                                haptics.impactOccurred()
                            }
                    }
                })
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}

/*
 ZStack {
 
 Circle()
 .frame(width: 84, height: 84, alignment: .center)
 
 Image(item.image)
 .resizable()
 .scaledToFit()
 .clipShape(Circle())
 }
 
 
 ForEach(animals) { item in
     Button(action: {
         selectedImage = item.image
     }, label: {
         Image(item.image)
             .resizable()
             .scaledToFit()
             .clipShape(Circle())
             .overlay(Circle().stroke(selectedImage == item.image ? Color.accentColor : Color.white, lineWidth: 2.0)) // User overlay for borner instead of ZStack and new circle so frame does not matter
     })
 }
 */
