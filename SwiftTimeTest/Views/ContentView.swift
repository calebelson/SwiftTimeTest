//
//  ContentView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 02/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var swiftTestsSuccessful = false
    @State var flutterTestsSuccessful = false
    @State var timers = [TimerModel(viewTested: "", testNumber: 0)]
    @State var shareDisabled = true
    @State private var viewsToTest = NavigationPath()
    
    var body: some View {
        VStack {
            NavigationStack(path: $viewsToTest) {                
                Button("Start Tests") {
                    viewsToTest.append(timers.count)
                }
                .disabled(timers.count == 5)
                .opacity(timers.count == 1 ? 1 : 0)
                .navigationDestination(for: Int.self) { i in
                    if i < 5 {
                        SwiftTestsView(timers: $timers, start: Date())
                            .onDisappear {
                                if timers.count <= 5 {
                                    viewsToTest.append(timers.count)
                                }
                            }
                            .navigationBarBackButtonHidden(true)
                    } else {
                        SendDataView(timers: $timers)
                            .navigationBarBackButtonHidden(true)
                    }

                }
//                
//                Spacer()
//                
//                Button("Then press here") {
//                    addAllTimers()
//                    
//                    shareDisabled = false
//                }
//                .disabled(timers.count != 5 || !shareDisabled)
//                .opacity(timers.count == 5 ? 1 : 0)
//                
//                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
