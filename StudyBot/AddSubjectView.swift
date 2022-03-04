//
//  AddSubjectView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 28/2/22.
//

import SwiftUI

struct AddSubjectView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var name = ""
    @State private var color = Color.red
    @State private var target = []
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SUBJECT DETAILS")) {
                    TextField("Subject", text: $name)
                    ColorPicker("Colour", selection: $color, supportsOpacity: false)
                }
                
                Section {
                    NavigationLink("Target", destination: TargetSettingsView())
                        
                }
                
                Section {
                    Button("Save") {
                        
                    }
                }
            }
            .navigationTitle("Add Subject")
        }
    }
}

struct AddSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectView()
    }
}
