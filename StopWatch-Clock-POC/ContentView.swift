//
//  ContentView.swift
//  StopWatch-Clock-POC
//
//  Created by Harpreet Kaur on 2023-12-15.
//

import SwiftUI

// enum for type of circle

enum CircleType {
    case small
    case big
}

// This views binds all view and create final watch
struct ContentView: View {
    
    @State var date: Date = Date()
    
    var body: some View {
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
      
        var minuteAngle:Double = 0
        var secondAngle: Double = 0
        
        if let minute = dateComponents.minute,
            let second = dateComponents.second {
            let radianInOneMinute = 2 * Double.pi / 60
            minuteAngle = Double(minute) * radianInOneMinute
            secondAngle = Double(second) * radianInOneMinute
        }
        return ZStack(alignment:.top) {
            
            // Outer watch
            Ticks(circleType: .big)
            WatchNumbers(circleTypes: .big)
            handWithCircle(angle: secondAngle, circleTypes: .big)
            
            // Inner watch
            ZStack {
                Ticks(circleType: .small)
                WatchNumbers(circleTypes: .small)
                handWithCircle(angle: minuteAngle, circleTypes: .small)
            }.frame(width:90,height: 90,alignment: .top)
                .padding(40)
                .onAppear(perform: start)
        }.frame(width:300,height: 300,alignment: .center)
            .onAppear(perform: start)
    }
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.date = Date()
        }
    }
}

#Preview {
    ContentView()
}
