//
//  WatchView.swift
//  StopWatch-Clock-POC
//
//  Created by Harpreet Kaur on 2023-12-18.
//

import SwiftUI

// This view is to create numbers to put inside watch
struct WatchNumbers: View {
    // we need to pass type of circle to generate number accordingly
    var circleTypes: CircleType = .small
    // Array to display numbers in small watch and bigger watch
    var smallCircleNumbers = [30, 5, 10, 15, 20, 25]
    var biggerCircleUmbers =  [60, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]
    // UI for displaying numbers on watch
    var body: some View {
        Canvas { context, size in
            
            let clockFrame = CGRect(x: 0,
                                    y: 0,
                                    width: circleTypes == .small ? 90 : 300,
                                    height: circleTypes == .small ? 90 : 300)
            
            var clockContext = context
            clockContext.translateBy(x: (size.width / 2) - 50, y: (size.height / 2) - 50)
            addLabels(toContext:context , frame: clockFrame, labelRatio: circleTypes == .small ? 0.3 : 0.4, labelArray: circleTypes == .small ? smallCircleNumbers : biggerCircleUmbers , labelDivided: circleTypes == .small ? 6 : 12)
        }
    }
}

func addLabels(toContext context: GraphicsContext, frame: CGRect, labelRatio: CGFloat, labelArray: [Int], labelDivided: CGFloat) {
    
    let innerFrame = getRect(fromRect: frame, ratio: labelRatio)
    let radius = innerFrame.size.width
    let midX = innerFrame.size.width / 2 + (innerFrame.origin.x / 2)
    let midY = innerFrame.size.height / 2 + (innerFrame.origin.y / 2)
    let labels = labelArray
    for index in 0 ..< labels.count {
        let angle = CGFloat(index) * CGFloat.pi * 2 / labelDivided - (CGFloat.pi / 2)
        let x = round(cos(angle) * radius) + midX
        let y = round(sin(angle) * radius) + midY
        let text = Text("\(labels[index])")
        context.draw(text, at: CGPoint(x: x, y: y))
    }
}

func getRect(fromRect rect: CGRect, ratio: CGFloat) -> CGRect {
    var newRect = rect
    newRect.size.width = newRect.size.width * ratio
    newRect.size.height = newRect.size.height * ratio
    newRect.origin.x = rect.size.width - newRect.size.width
    newRect.origin.y = rect.size.height - newRect.size.height
    return newRect
}

#Preview {
    WatchNumbers()
}
