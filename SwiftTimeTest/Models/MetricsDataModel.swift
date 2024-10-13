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
        self.allData.append("""
                            \(timer.getNameAndTestNumber()):
                              start: \(timer.getStartTime())
                              end: \(timer.getEndTime())
                              duration: \(timer.getDuration())
                            """)
    }
    
    private func writeToFile() -> URL {
        let str = joinAllData()
        let filename = getDocumentsDirectory().appendingPathComponent("SwiftTimeTest.txt")

        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            print(error)
        }
        
        return filename
    }
    
    func getFileName() -> URL {
        return writeToFile()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func joinAllData() -> String {
        let joined = allData.joined(separator: "\n")
        return joined
    }
}

