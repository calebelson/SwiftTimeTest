//
//  ContentView.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 02/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var timers: [TimerModel] = []
    @State private var viewsToTest = NavigationPath()
    
    var body: some View {
        VStack {
            NavigationStack(path: $viewsToTest) {                
                Button("Start Tests") {
                    viewsToTest.append(timers.count)
                }
                .disabled(timers.count != 0)
                .opacity(timers.count == 0 ? 1 : 0)
                .navigationDestination(for: Int.self) { i in
                    switch i {
                    case 0...4:
                        SwiftTestsView(timers: $timers, start: Date())
                            .onDisappear {
                                if timers.count <= 5 {
                                    viewsToTest.append(timers.count)
                                }
                            }
                            .navigationBarBackButtonHidden(true)
                    default:
                        SendDataView(timers: $timers)
                            .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
