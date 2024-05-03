//
//  Ticks.swift
//  StopWatch-Clock-POC
//
//  Created by Harpreet Kaur on 2023-12-18.
//

import SwiftUI

// Ticks inside watch circle
struct Ticks: View {
    var circleType: CircleType = .small
    var body: some View {
            if circleType == .big {
                BigCircleView()
            } else {
                SmallCircleView()
                }
    }
}

// ticks for bigger circle
struct BigCircleView: View {
    var body: some View {
        
        // we want total 240 = 20 * 12 for full circle
            ForEach(0 ..< 240) { tick in
                VStack {
        // we want ticks to be in reactangle shape and below code defined its UI
                Rectangle()
                    .fill(Color.primary)
                    .opacity(tick % 20 == 0 ? 1 : 0.4)
                    .frame(width: 2, height: tick % 4 == 0 ? 15 : 7)
                Spacer()
            }
                // This code will put ticks in circle
            .rotationEffect(Angle.degrees(Double(tick) / 240 * 360))
        }
    }
}

// ticks for smaller circle
struct SmallCircleView: View {
    var body: some View {
        // we want total 60 = 10 * 6 for full circle
        ForEach(0 ..< 60) { tick in
            VStack {
                Rectangle()
                // we want ticks to be in reactangle shape and below code defined its UI
                    .fill(Color.primary)
                    .opacity(tick % 10 == 0 ? 1 : 0.4)
                    .frame(width: 2, height: tick % 2 == 0 ? 8 : 4)
                Spacer()
            }
            // This code will put ticks in circle
            .rotationEffect(Angle.degrees(Double(tick) / 60 * 360))
        }
    }
}


#Preview {
    Ticks()
}
