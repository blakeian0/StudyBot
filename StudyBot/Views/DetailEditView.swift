//
//  DetailEditView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 22/3/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Subjects.Data
    
    let themes = ["red", "orange", "yellow", "green", "mint", "teal", "cyan", "blue", "indigo", "purple", "pink", "brown"]
    
    var body: some View {
        Form {
            Section(header: Text("Subject Details")) {
                TextField("Name", text: $data.name)
                ThemePicker(selection: $data.theme)

            }
            Section {
                HStack {
                    Slider(value: $data.goal, in: 0...30, step: 1) {
                        Text("Goal")
                    }
                    Spacer()
                    Text("\(Int(data.goal)) hours")
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Subjects.sampleData[0].data))
    }
}
