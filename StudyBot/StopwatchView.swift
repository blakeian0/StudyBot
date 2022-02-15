//
//  StopwatchView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

struct StopwatchView: View {
    ///Current Progress time expressed in seconds
    @State var startingTime = 25 * 60
    @State var countdownTimer = 25 * 60
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var minutes: String {
        String((countdownTimer % 3600) / 60)
    }
    
    var seconds: String {
        if (countdownTimer % 60) < 10 {
            return  "0" + String(countdownTimer % 60)
        } else {
            return String(countdownTimer % 60)
        }
    }
    
    var body: some View {
        VStack {
            Text("\(minutes):\(seconds)").onReceive(timer) { _ in
                if countdownTimer > 0 && timerRunning {
                    countdownTimer -= 1
                } else {
                    timerRunning = false
                }
            }
            .font(.system(size: 90))
            
            
            HStack(spacing: 30) {
                Button("Start") {
                    timerRunning = true
                }
                
                Button("Reset") {
                    countdownTimer = startingTime
                }
            }
            
            Text("\(countdownTimer)")
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
