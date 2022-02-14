//
//  StopwatchView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

struct StopwatchView: View {
    ///Current Progress time expressed in seconds
    @State var countdownTimer = 5
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        VStack {
            Text("\(countdownTimer)").onReceive(timer) { _ in
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
                    countdownTimer = 5
                }
            }
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
