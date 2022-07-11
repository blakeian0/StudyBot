//
//  MiniSummaryView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 27/6/22.
//

import SwiftUI

struct MiniSummaryView: View {
    @Binding var subject: Subjects
    @State private var progress: Float = 1
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(subject.name)
            ZStack(alignment: .leading) {
                ProgressView(value: progress, total: subject.goal)
                    .scaleEffect(x: 1, y: 8, anchor: .center)
                    .tint(subject.theme.mainColor)
                    .onReceive(timer) { _ in
                        withAnimation(.linear) {
                            progress = subject.completed
                        }
                    }
                
                Text("\(String(format: "%.1f", (subject.completed))) hours completed")
                    .padding(.leading)
            }
            
            HStack {
                Text("0")
                Spacer()
                Text("\(String(format: "%.1f", (subject.goal))) hours")
            }
            
            
            
        }
        .padding()
    }
}

struct MiniSummaryView_Previews: PreviewProvider {
    static var subject = Subjects.sampleData[0]
    
    static var previews: some View {
        MiniSummaryView(subject: .constant(subject))
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
