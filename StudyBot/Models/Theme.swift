//
//  Theme.swift
//  StudyBot
//
//  Created by Blake Buddingh on 22/3/22.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    
    case red
    case orange
    case yellow
    case green
    case mint
    case teal
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    
    var accentColor: Color {
        Color("TextColor")
    }
    var mainColor: Color {
        switch self {
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        case .mint:
            return Color.mint
        case .teal:
            return Color.teal
        case .cyan:
            return Color.cyan
        case .blue:
            return Color.blue
        case .indigo:
            return Color.indigo
        case .purple:
            return Color.purple
        case .pink:
            return Color.pink
        case .brown:
            return Color.brown
        }
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
