//
//  SettingsView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 21/2/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var subjects: [Subjects]
    
    @State private var startingTime = Float(UserDefaults.standard.integer(forKey: "startingTime")) / 60
    @State private var startingBreak = Float(UserDefaults.standard.integer(forKey: "startingBreak")) / 60
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    NavigationLink("Subjects", destination: SubjectView(subjects: $subjects))
                }
                
                Section(header: Text("Timer Lengths")) {
                    HStack {
                        Image(systemName: "clock")
                        Slider(value: $startingTime, in: 1...30, step: 1)
                        Spacer()
                        Text("\(Int(startingTime)) minutes")
                    }
                    
                    HStack {
                        Image(systemName: "powersleep")
                        Slider(value: $startingBreak, in: 1...30, step: 1)
                        Spacer()
                        Text("\(Int(startingBreak)) minutes")
                    }
                    
                    Button(action: {
                        startingTime = 30
                        startingBreak = 5
                        UserDefaults.standard.set((Int(startingTime) * 60), forKey: "startingTime")
                        UserDefaults.standard.set((Int(startingBreak) * 60), forKey: "startingBreak")
                    }) {
                        HStack {
                            Spacer()
                            Text("Reset Defaults")
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        UserDefaults.standard.set((Int(startingTime) * 60), forKey: "startingTime")
                        UserDefaults.standard.set((Int(startingBreak) * 60), forKey: "startingBreak")
                    }) {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                }
                
                Section {
                    Button(role: .destructive, action: {
                        
                    }) {
                        HStack {
                            Spacer()
                            Text("Reset Completed Study")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(subjects: .constant(Subjects.sampleData))
    }
}
