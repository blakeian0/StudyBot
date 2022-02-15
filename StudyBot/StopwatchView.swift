//
//  StopwatchView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

struct StopwatchView: View {
    ///Non-configuarable
    @State var countdownTimer = 0
    @State var timerRunning = false
    @State var progress: CGFloat = 0
    
    //Configuarable
    @State var startingTime = 25 * 60
    @State var breakTime = 25 * 60
    @State var sessionNum = "3"
    @State var sessionCount = "5"
    @State var timerName = "Focused Study"
    
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
    
    var breakMinutes: String {
        String((breakTime % 3600) / 60)
    }
    
    func onStart() {
        countdownTimer = startingTime
    }
    
    var body: some View {
        VStack {
            Text("Session: \(sessionNum)/\(sessionCount)")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            ZStack{
                VStack {
                    Text(timerName)
                        .font(.system(size: 24))
                    
                    Text("\(minutes):\(seconds)").onReceive(timer) { _ in
                        if countdownTimer > 0 && timerRunning {
                            countdownTimer -= 1
                            withAnimation() {
                                progress = 1 - CGFloat(Float(countdownTimer) / Float(startingTime))
                            }
                        } else {
                            timerRunning = false
                        }
                    }
                    .font(.system(size: 72))
                    
                    HStack {
                        Image(systemName: "clock")
                            .font(.system(size: 24))
                        Text("\(breakMinutes):00")
                            .font(.system(size: 24))
                    }

                }

                
                CircularProgressBar(circleProgress: $progress, widthAndHeight: 300, staticColor: .accentColor, progressColor: .gray, showLabel: false)
                    .onAppear(perform: onStart)
            }

            
            
            HStack(spacing: 30) {
                Button("Start") {
                    timerRunning = true
                }
                
                Button("Reset") {
                    countdownTimer = startingTime
                    progress = 0
                }
            }
            
            Text("\(countdownTimer), \(progress)")
            
            Button(action: {
                print("Round Action")
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.accentColor, lineWidth: 3)
                            .frame(width: 110, height: 110)
                        Text("Press")
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.black)
                            .background(Color.accentColor)
                            .clipShape(Circle())
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
