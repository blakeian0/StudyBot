//
//  SubjectView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 4/3/22.
//

import SwiftUI

struct SubjectView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("subject")
            }
            .navigationTitle("Subjects")
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView()
    }
}
