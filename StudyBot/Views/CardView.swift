//
//  CardView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 22/3/22.
//

import SwiftUI

struct CardView: View {
    let subject: Subjects
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(subject.name)
                .font(.headline)
            HStack {
                Label("\(String(format: "%.1f", (subject.goal))) hours", systemImage: "calendar.circle")
                    .padding(.trailing, 20)
                Spacer()
                Label("\(String(format: "%.1f", Float(subject.goal) - subject.completed)) hours left", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(subject.theme.accentColor)
        .background(subject.theme.mainColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var subject = Subjects.sampleData[0]
    static var previews: some View {
        CardView(subject: subject)
            .background(subject.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 600))
    }
}
