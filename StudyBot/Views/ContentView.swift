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
        if (subjects.isEmpty) || (UserDefaults.standard.integer(forKey: "startingTime") == 0) {
            Button("Start") {
                UserDefaults.standard.set((30*60), forKey: "startingTime")
                UserDefaults.standard.set((5*60), forKey: "startingBreak")
                subjects = Subjects.sampleData
            }
        } else {
            TabView {
                SummaryView(subjects: $subjects)
                    .tabItem {
                        Image(systemName: "clock.circle")
                        Text("Summary")
                    }
                StopwatchView(subjects: $subjects, subject: Subjects.sampleData[0])
                    .tabItem {
                        Image(systemName: "book.circle")
                        Text("Study")
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
