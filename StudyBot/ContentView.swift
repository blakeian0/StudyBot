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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
