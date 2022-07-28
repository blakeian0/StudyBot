//
//  SummaryView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 28/7/22.
//

import SwiftUI

struct SummaryView: View {
    @Binding var subjects: [Subjects]
    
    var body: some View {
        NavigationView {
            List {
                /// Lists subjects as a CardView Object
                ForEach($subjects) { $subject in
                    MiniSummaryView(subject: $subject)
                        
                }
            }
            .navigationTitle("Summary")
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(subjects: .constant(Subjects.sampleData))
    }
}
