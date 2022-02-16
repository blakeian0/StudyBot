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
    @State var countdownBreak = 0
    @State var countdownInterruption = 0
    @State var timerRunning = false
    @State var progress: CGFloat = 0
    @State var mode = "start"
    @State var buttonText = "Start"
    
    
    
    //Configuarable
    @State var startingTime = 15
    @State var startingBreak = 5 * 60
    @State var sessionNum = "3"
    @State var sessionCount = "5"
    @State var timerName = "Focused Study"
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var minutes = "0"
    @State var seconds = "00"
    
    var timerMinutes: String {
        String((countdownTimer % 3600) / 60)
    }
    
    var timerSeconds: String {
        if (countdownTimer % 60) < 10 {
            return  "0" + String(countdownTimer % 60)
        } else {
            return String(countdownTimer % 60)
        }
    }
    
    var breakMinutes: String {
        String((countdownBreak % 3600) / 60)
    }
    
    var breakSeconds: String {
        if (countdownBreak % 60) < 10 {
            return  "0" + String(countdownBreak % 60)
        } else {
            return String(countdownBreak % 60)
        }
    }
    
    var interruptionMinutes: String {
        String((countdownInterruption % 3600) / 60)
    }
    
    var interruptionSeconds: String {
        if (countdownInterruption % 60) < 10 {
            return  "0" + String(countdownInterruption % 60)
        } else {
            return String(countdownInterruption % 60)
        }
    }
    
    func onStart() {
        countdownTimer = startingTime
        countdownBreak = startingBreak
        minutes = timerMinutes
        seconds = timerSeconds
    }
    
    /// Dynamic Function Colours
    func colorAsset(mode: String) -> Color {
        if (mode == "start") {
            return Color("StartColor")
        }
        else if (mode == "timer") {
            return Color("TimerColor")
        }
        else if (mode == "interruption") {
            return Color("InterruptedColor")
        }
        else if (mode == "break"){
            return Color("BreakColor")
        }
        else {
            return Color.black
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            /// Session Text
            Text("Session: \(sessionNum)/\(sessionCount)")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            /// Timer
            ZStack{
                VStack {
                    Text(timerName)
                        .font(.system(size: 24))
                    
                    Text("\(minutes):\(seconds)").onReceive(timer) { _ in
                        if (mode == "timer") {
                            if countdownTimer > 0 && timerRunning {
                                countdownTimer -= 1
                                withAnimation() {
                                    progress = 1 - CGFloat(Float(countdownTimer) / Float(startingTime))
                                }
                            } else {
                                timerRunning = false
                                mode = "break"
                                progress = 0
                                timerName = "Break"
                                minutes = breakMinutes
                                seconds = breakSeconds
                                timerRunning = true
                            }
                            minutes = timerMinutes
                            seconds = timerSeconds
                            
                        } else if (mode == "break") {
                            if countdownBreak > 0 && timerRunning {
                                countdownBreak -= 1
                                withAnimation() {
                                    progress = 1 - CGFloat(Float(countdownBreak) / Float(startingBreak))
                                }
                            } else {
                                timerRunning = false
                                mode = "break"
                            }
                            
                            minutes = breakMinutes
                            seconds = breakSeconds
                            
                        } else if (mode == "interruption") {
                            minutes = interruptionMinutes
                            seconds = interruptionSeconds
                            countdownInterruption += 1
                            withAnimation() {
                                progress = 0
                            }
                        }
                        

                    }
                    .font(.system(size: 72))
                    
                    HStack {
                        Image(systemName: "clock")
                            .font(.system(size: 24))
                        Text("\(breakMinutes):\(breakSeconds)")
                            .font(.system(size: 24))
                    }

                }

                
                CircularProgressBar(circleProgress: $progress, widthAndHeight: 300, staticColor: colorAsset(mode: self.mode), progressColor: .gray, showLabel: false)
                    .onAppear(perform: onStart)
            }

            /// Button
            Button(action: {
                if (mode == "start") {
                    mode = "timer"
                    timerRunning = true
                    buttonText = "Pause"
                }
                else if (mode == "timer") {
                    mode = "interruption"
                    timerRunning = false
                    buttonText = "Resume"
                    timerName = "Interruption"
                    minutes = interruptionMinutes
                    seconds = interruptionSeconds
                }
                else if (mode == "interruption") {
                    mode = "timer"
                    timerRunning = true
                    buttonText = "Pause"
                    timerName = "Focused Study"
                    minutes = timerMinutes
                    seconds = timerSeconds
                }
                
                
                }) {
                    ZStack {
                        Circle()
                            .stroke(colorAsset(mode: self.mode), lineWidth: 3)
                            .frame(width: 110, height: 110)
                        Text(buttonText)
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.black)
                            .background(colorAsset(mode: self.mode))
                            .clipShape(Circle())
                    }
            }
            
            ///Debug Reset
            Button("Reset") {
                timerRunning = false
                countdownTimer = startingTime
                progress = 0
            }
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
            
    }
}
