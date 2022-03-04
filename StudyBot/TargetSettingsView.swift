//
//  TargetSettingsView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 28/2/22.
//

import SwiftUI

struct TargetSettingsView: View {
    @State private var mondayGoal = "0 hours"
    @State private var tuesdayGoal = "0 hours"
    @State private var wednesdayGoal = "0 hours"
    @State private var thursdayGoal = "0 hours"
    @State private var fridayGoal = "0 hours"
    @State private var saturdayGoal = "0 hours"
    @State private var sundayGoal = "0 hours"
    
    let wheelOptions = ["0 hours": 0, "1 hour": 1, "2 hours": 2, "3 hours": 3, "4 hours": 4, "5 hours": 5]

    
    let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        Form {
            Section {
                Picker("Monday", selection: $mondayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
                Picker("Tuesday", selection: $tuesdayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
                Picker("Wednesday", selection: $wednesdayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
                Picker("Thursday", selection: $thursdayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
                Picker("Friday", selection: $fridayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
                Picker("Saturday", selection: $saturdayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
                Picker("Sunday", selection: $sundayGoal) {
                    ForEach(wheelOptions.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
            }
        }
        .navigationTitle("Target")
    }
}

struct TargetSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TargetSettingsView()
    }
}
