//
//  MiniSummaryView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 27/6/22.
//

import SwiftUI

struct MiniSummaryView: View {
    let subject: Subjects
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MiniSummaryView_Previews: PreviewProvider {
    static var subject = Subjects.sampleData[0]
    
    static var previews: some View {
        MiniSummaryView(subject: subject)
            .background(subject.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 600))
    }
}
