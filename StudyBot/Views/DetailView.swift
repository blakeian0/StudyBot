//
//  DetailView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 22/3/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var subject: Subjects
    @Binding var subjects: [Subjects]
    
    @State private var showAlert = false
    @State private var showWarning = false
    
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
            
            Section {
                Button("Delete") {
                    if subjects.count == 1 {
                        showWarning = true
                    } else {
                        showAlert = true
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color.red)

            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Confirm Deletion"),
                      message: Text("Are you sure you want to delete the subject \(subject.name)?"),
                    primaryButton: .destructive(Text("Delete")) {
                    subjects.remove(at: subjects.firstIndex(where: {$0.name == subject.name}) ?? 0)
                    },
                    secondaryButton: .cancel())
            }
            .alert("You cannot delete the only subject. There must be a minimum of one.", isPresented: $showWarning) {
                Button("OK", role: .cancel) {}
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
            DetailView(subject: .constant(Subjects.sampleData[0]), subjects: .constant(Subjects.sampleData))
        }
    }
}
