//
//  StudyBotApp.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

@main
struct StudyBotApp: App {
    @StateObject private var store = SubjectStore()

    var body: some Scene {
        WindowGroup {
            ContentView(subjects: $store.subjects) {
                SubjectStore.save(subjects: store.subjects) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .onAppear {
                SubjectStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let subjects):
                        store.subjects = subjects
                    }
                }
            }
        }
    }
}
