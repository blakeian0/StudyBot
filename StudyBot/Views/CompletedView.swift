//
//  CompletedView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 1/7/22.
//

import SwiftUI

struct CompletedView: View {
    var timeToAdd: Int
    var subject: Subjects
    
    var body: some View {
        Text("Congrats, \(timeToAdd/60) min added to \(subject.name)")
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView(timeToAdd: 60, subject: Subjects.sampleData[0])
    }
}
