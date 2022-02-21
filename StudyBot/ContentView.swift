//
//  ContentView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StopwatchView()
                .badge(0)
                .tabItem {
                    Image(systemName: "book.circle")
                    Text("Study")
                }
            SubjectView()
                .badge(0)
                .tabItem {
                    Image(systemName: "folder.circle")
                    Text("Subjects")
                }
            Text("Calendar")
                .badge(0)
                .tabItem {
                    Image(systemName: "calendar.circle")
                    Text("Calendar")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
