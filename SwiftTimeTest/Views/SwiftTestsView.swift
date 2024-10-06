//
//  SwiftTestsView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 02/10/2024.
//

import SwiftUI

struct SwiftTestsView: View {
    @Binding var swiftTestsSuccessful: Bool
    private let timer: TimerModel
    
    init(swiftTestsSuccessful: Binding<Bool>) {
        timer = TimerModel(viewTested: "SwiftTestView", testNumber: 1)
        timer.startTimer()
        self._swiftTestsSuccessful = swiftTestsSuccessful
    }
    
    var body: some View {
        VStack {
            Text("Swift tests")
            
            Button("Run swift tests") {
                swiftTestsSuccessful = !swiftTestsSuccessful
            }
            
            Text("Swift tests successful: \(swiftTestsSuccessful)")
        }
        .onAppear {
            timer.stopTimer()
            timer.exportTime()
        }
    }
}

#Preview {
    struct Preview: View {
        @State var swiftTestsSuccessful = true
        
        var body: some View {
            SwiftTestsView(swiftTestsSuccessful: $swiftTestsSuccessful)
        }
    }

    return Preview()
}
