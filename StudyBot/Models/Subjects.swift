//
//  SubjectModel.swift
//  StudyBot
//
//  Created by Blake Buddingh on 22/3/22.
//

import Foundation

struct Subjects: Identifiable, Codable {
    let id: UUID
    var name: String
    var goal: Float
    var theme: Theme
    var completed: Float
    
    init(id: UUID = UUID(), name: String, goal: Float, theme: Theme, completed: Float) {
        self.id = id
        self.name = name
        self.goal = goal
        self.theme = theme
        self.completed = completed
    }
}

extension Subjects {
    struct Data {
        var name: String = ""
        var goal: Float = 0
        var theme: Theme = .red
        var completed: Float = 0
    }
    
    var data: Data {
        Data(name: name, goal: Float(goal), theme: theme, completed: Float(completed))
    }
    
    mutating func update(from data: Data) {
        name = data.name
        goal = Float(data.goal)
        theme = data.theme
        completed = Float(data.completed)
        
    }
}

extension Subjects {
    static let sampleData: [Subjects] =
    [
        Subjects(name: "English", goal: 2, theme: .green, completed: 1.2),
        Subjects(name: "Maths", goal: 4, theme: .red, completed: 0),
        Subjects(name: "Science", goal: 3, theme: .blue, completed: 0)
    ]
}
