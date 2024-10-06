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
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    NavigationLink("Swift Tests") {
                        SwiftTestsView(swiftTestsSuccessful: $swiftTestsSuccessful)
                    }
                    NavigationLink("Flutter Tests") {
                        FlutterTestsView(flutterTestsSuccessful: $flutterTestsSuccessful)
                    }
                }
                .navigationTitle("Home")
                
                ShareLink("Send data once tests are run", item: "xD", preview: SharePreview("Test Data"))
                    .disabled(!(swiftTestsSuccessful && flutterTestsSuccessful))
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
