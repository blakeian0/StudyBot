//
//  SubjectView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 4/3/22.
//

import SwiftUI

struct SubjectView: View {
    @Binding var subjects: [Subjects]
    @State private var isPresentingNewSubjectView = false
    @State private var newSubjectData = Subjects.Data()
    
    var body: some View {
        List {
            ForEach($subjects) { $subject in
                NavigationLink(destination: DetailView(subject: $subject, subjects: $subjects)) {
                    CardView(subject: subject)
                }

                .listRowBackground(subject.theme.mainColor)
            }
        }
        .navigationTitle("Subjects")
        .toolbar {
            Button(action: {
                isPresentingNewSubjectView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewSubjectView) {
            NavigationView {
                DetailEditView(data: $newSubjectData)
                    .navigationTitle("New Subject")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewSubjectView = false
                                newSubjectData = Subjects.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newSubject = Subjects(name: newSubjectData.name, goal: newSubjectData.goal, theme: newSubjectData.theme, completed: newSubjectData.completed)
                                subjects.append(newSubject)
                                newSubjectData = Subjects.Data()
                                isPresentingNewSubjectView = false
                            }
                        }
                    }
            }
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(subjects: .constant(Subjects.sampleData))
    }
}
