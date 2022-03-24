//
//  ContentView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI


struct ContentView: View {
    @Binding var subjects: [Subjects]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()-> Void
    
    var body: some View {
        /// Check to see if subjects is empty and if so, populate with default values
        if (subjects.isEmpty) {
            Button("Start") {
                subjects = Subjects.sampleData
            }
        } else {
            TabView {
                StopwatchView(subjects: $subjects)
                    .tabItem {
                        Image(systemName: "book.circle")
                        Text("Study")
                    }
                Text("Calendar")
                    .tabItem {
                        Image(systemName: "calendar.circle")
                        Text("Calendar")
                    }
                SettingsView(subjects: $subjects)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }

            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(subjects: .constant(Subjects.sampleData), saveAction: {})
    }
}
