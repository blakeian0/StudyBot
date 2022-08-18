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
    
    
    // This forms the structure of the settings page.
    var body: some View {
        NavigationView {
            Form {
                Section{
                    NavigationLink("Subjects", destination: SubjectView(subjects: $subjects))
                    
                    NavigationLink("Online Help", destination: OnlineHelpView())
                }
                
                Section(header: Text("Timer Lengths")) {
                    HStack {
                        //Shows the slider for the starting time restricted from 1-90
                        Image(systemName: "clock")
                        Slider(value: $startingTime, in: 1...90, step: 1)
                        Spacer()
                        Text("\(Int(startingTime)) minutes")
                    }
                    
                    HStack {
                        //Shows the slider for the break time restricted from 1-30
                        Image(systemName: "powersleep")
                        Slider(value: $startingBreak, in: 1...30, step: 1)
                        Spacer()
                        Text("\(Int(startingBreak)) minutes")
                    }
                    
                    Button(action: {
                        //The button that resets to default
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
                        //The action of setting the userdefaults to the starting times and break.
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
