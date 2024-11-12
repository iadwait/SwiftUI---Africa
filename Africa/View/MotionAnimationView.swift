//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Adwait Barkale on 07/11/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomNumber: Int = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // Functions
    // 1. Random Coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. Random Size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // 5. Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                ForEach(0...randomNumber, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width), //geometry.size.width / 2,
                            y: randomCoordinate(max: geometry.size.height) //geometry.size.height / 2
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
                //Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
            }// : ZStack
            .drawingGroup()
        })
    }
}

#Preview {
    MotionAnimationView()
}
