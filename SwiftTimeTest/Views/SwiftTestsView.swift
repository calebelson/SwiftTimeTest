//
//  SwiftTestsView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 02/10/2024.
//

import SwiftUI

struct SwiftTestsView: View {
    @Binding var timers: [TimerModel]
    private let timer: TimerModel
    private let start: Date
    @Environment(\.dismiss) var dismiss
    
    init(timers: Binding<[TimerModel]>, start: Date) {
        self.start = start
        timer = TimerModel(viewTested: "SwiftTestView", testNumber: timers.count)
        self._timers = timers
    }
    
    var body: some View {
        VStack {
            Text("Swift tests")
        }
        .onAppear {
            timer.setStartTime(start)
            timer.stopTimer()
            timers.append(timer)
            dismiss()
        }
    }
}

#Preview {
    struct Preview: View {
        @State var timers = [TimerModel(viewTested: "SwiftTestView", testNumber: 1)]
        
        var body: some View {
            SwiftTestsView(timers: $timers, start: Date())
        }
    }

    return Preview()
}
