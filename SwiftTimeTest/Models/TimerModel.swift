//
//  TimerModel.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 03/10/2024.
//

import Foundation

class TimerModel {
    private var initTime: Date?
    private var finishTime: Date?
    private let viewTested: String
    private let testNumber: Int
    
    init(viewTested: String, testNumber: Int) {
        self.viewTested = viewTested
        self.testNumber = testNumber
    }
    
    
    
    
    func startTimer() {
        initTime = Date()
    }
    
    func stopTimer() {
        finishTime = Date()
    }
    
    func getTimeToRun() -> TimeInterval {
        guard let initTime, let finishTime else { return 0 }
        
        return finishTime.timeIntervalSince(initTime)
    }
    
    func exportTime() {
        print(getTimeToRun())
    }
}
