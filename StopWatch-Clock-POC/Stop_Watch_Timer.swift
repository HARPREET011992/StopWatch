//
//  Stop_Watch_Timer.swift
//  StopWatch-Clock-POC
//
//  Created by Harpreet Kaur on 2024-05-07.
//

import Foundation

class Stop_Watch_Timer: ObservableObject {
    
    @Published var counter: Int = 0
    var timer = Timer()
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.counter += 1
        }
    }
    
    func stop() {
        self.timer.invalidate()
    }
    
    func reset() {
        self.counter = 0
        self.timer.invalidate()
    }
}
