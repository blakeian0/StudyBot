//
//  DetailView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 22/3/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var subject: Subjects
    
    @State private var data = Subjects.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("SUBJECT DETAILS")) {
                HStack {
                    Label("Name", systemImage: "clock")
                        .font(.headline)
                    Spacer()
                    Text(subject.name)
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                        .font(.headline)
                    Spacer()
                    Text(subject.theme.name)
                        .padding(4)
                        .foregroundColor(subject.theme.accentColor)
                        .background(subject.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            
            Section {
                HStack {
                    Label("Study Goal", systemImage: "clock")
                        .font(.headline)
                    Spacer()
                    Text("\(String(subject.goal)) hours")
                }
            }
        }
        .navigationTitle(subject.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = subject.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(subject.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                subject.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(subject: .constant(Subjects.sampleData[0]))
        }
    }
}
