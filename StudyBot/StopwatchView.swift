//
//  StopwatchView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

struct StopwatchView: View {
    ///Current Progress time expressed in seconds
    @State private var progressTime = 0
    
    ///Computing properties
    var hours: Int {
        progressTime / 3600
    }
    
    var minutes: Int {
      (progressTime % 3600) / 60
    }

    var seconds: Int {
      progressTime % 60
    }
    
    /// Increase progressTime each second
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            progressTime += 1
        }
    }
    
    var body: some View {
        Text("Stopwatch")
        Text("\(hours):\(minutes):\(seconds)")
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
