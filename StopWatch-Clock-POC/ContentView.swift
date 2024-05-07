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
    
    @ObservedObject var stopWatch = Stop_Watch_Timer()
    @State var showStop = false
    
    var body: some View {
        
        var minuteAngle:Double = 0
        var secondAngle: Double = 0
        
         let minute = Int(stopWatch.counter) / 60,
            second = Int(stopWatch.counter) % 60
            let radianInOneMinute = 2 * Double.pi / 60
            minuteAngle = Double(minute) * radianInOneMinute
            secondAngle = Double(second) * radianInOneMinute
        
        return VStack {
            Text(formattedTime())
                .font(.largeTitle)
            ZStack(alignment:.top) {
                
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
            }.frame(width:300,height: 300,alignment: .center)
            HStack {
                ZStack {
                    Button(action: {
                    showStop ? stopWatch.stop() : stopWatch.start()
                    showStop.toggle()
                    }, label: {
                        Text(showStop ? "STOP" : "START")
                    })
                    .frame(width: 100, height: 100)
                    .background(showStop ? .red : .green)
                    .foregroundColor(.black)
                    .clipShape(.circle)
                }
                Spacer()
                ZStack {
                    Button(action: {
                        if showStop == true {
                            showStop = false
                        }
                    stopWatch.reset()
                    }, label: {
                        Text("RESTART")
                    })
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .foregroundColor(.black)
                    .clipShape(.circle)
                }
            }.frame(width: 300)
        }
    }
    private func formattedTime() -> String {
        let minutes = Int(stopWatch.counter) / 60
        let seconds = Int(stopWatch.counter) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    ContentView()
}
