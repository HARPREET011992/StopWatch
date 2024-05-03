//
//  Hand.swift
//  StopWatch-Clock-POC
//
//  Created by Harpreet Kaur on 2023-12-18.
//

import SwiftUI

// This UI View will create moving hand to point numbers
struct handWithCircle: View {
    var angle:Double = 60.0
    var circleTypes: CircleType = .small
    var body: some View {
        ZStack {
            // This will craete circle in centre
            if circleTypes == .small {
                Circle()
                    .fill(.orange)
                    .frame(width: 10, height: 10, alignment: .center)
            } else {
                Circle()
                    .stroke(.orange,lineWidth:2)
                    .frame(width: 15, height: 15, alignment: .center)
            }
            // This is to create line attached to circle 
            Hand(offSet : circleTypes == .small ? 2 : 7.5 )
                .fill()
                .foregroundColor(.orange)
                .frame(width:2,alignment: .center)
                .rotationEffect(.radians(angle))
        }
    }
}

struct Hand: Shape {
    var offSet: CGFloat = 0
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // this will create rotation effect for hand
        path.addRoundedRect(in: CGRect(origin: CGPoint(x: rect.origin.x, y: rect.origin.y), size: CGSize(width: rect.width, height: rect.height/2 - offSet)), cornerSize: CGSize(width: rect.width/2, height: rect.width/2))
        return path
    }
}

#Preview {
    handWithCircle()
}
