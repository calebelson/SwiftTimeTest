//
//  SendDataView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 07/10/2024.
//

import SwiftUI

struct SendDataView: View {
    @Binding var timers: [TimerModel]
    var data = MetricsData()
    
    init(timers: Binding<[TimerModel]>) {
        self._timers = timers
        addAllTimers()
    }
    
    var body: some View {
        ShareLink("Finally, send the data", item: data.getAllData(), preview: SharePreview("Test Data"))
    }
    
    func addAllTimers() {
        for timer in timers {
            print("viewTested: \(timer.getNameAndTestNumber()), start: \(timer.getStartTime()), end: \(timer.getEndTime()), duration: \(timer.getDuration())")
            
            data.addData(timer: timer)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var timers = [TimerModel(viewTested: "SwiftTestView", testNumber: 1)]
        
        var body: some View {
            SendDataView(timers: $timers)
            SendDataView(timers: $timers)
        }
    }
    
    return Preview()
}
