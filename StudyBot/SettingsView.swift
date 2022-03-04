//
//  SettingsView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 21/2/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var genre = ""
    let genres = ["maths", "science", "english"]
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    NavigationLink("Subjects", destination: SubjectView())
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
