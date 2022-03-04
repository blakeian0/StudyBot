//
//  ContentView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI


struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var subjects: FetchedResults<Subject>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        
        VStack {
            Button("Add") {
                let subjectsRand = ["Maths", "English", "History", "IPT", "SDD"]
                let subjectRand = subjectsRand.randomElement()!
                
                let subject = Subject(context: moc)
                subject.id = UUID()
                subject.name = subjectRand
                
                try? moc.save()
            }
            
            List(subjects) { subject in
                Text(subject.name ?? "Unknown")
            }
        }
        

        /*
        TabView {
            StopwatchView()
                .tabItem {
                    Image(systemName: "book.circle")
                    Text("Study")
                }
            Text("Calendar")
                .tabItem {
                    Image(systemName: "calendar.circle")
                    Text("Calendar")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
