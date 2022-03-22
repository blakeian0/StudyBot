//
//  SettingsView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 21/2/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var subjects: [Subjects]
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    NavigationLink("Subjects", destination: SubjectView(subjects: $subjects))
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
