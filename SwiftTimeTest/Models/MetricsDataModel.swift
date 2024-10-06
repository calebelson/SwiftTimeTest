//
//  MetricsModel.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 03/10/2024.
//

import UIKit

class MetricsData {
    private var allData: [String]
    
    init () {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        
        // Get model, OS info, and current date
        self.allData = [UIDevice.modelName, UIDevice.current.systemName, UIDevice.current.systemVersion, dateString]
    }
    
    func addData(timer: TimerModel) {
        self.allData.append(timer.getNameAndTestNumber() + """
                            : start: \(timer.getStartTime()),
                              end: \(timer.getEndTime()),
                              duration: \(timer.getDuration())
                            """)
    }
    
    func getAllData() -> String {
        let joined = allData.joined(separator: "\n")
        return joined
    }
}

