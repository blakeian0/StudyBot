//
//  StopwatchView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 11/2/22.
//

import SwiftUI

struct StopwatchView: View {
    @Binding var subjects: [Subjects]
    
    ///Non-configuarable
    @State var countdownTimer = 0
    @State var countdownBreak = 0
    @State var countdownInterruption = 0
    @State var timerRunning = false
    @State var progress: CGFloat = 0
    @State private var dropdownDisabled = false
    
    @State var colorMode = "start"
    @State var buttonText = "Start"
    @State var scene = "start"
    @State var timerName = "Focused Study"
    
    @State var buttonOpacity = 0.0
    @State var startOpacity = 1.0
    @State var infoOpacity = 0.0
    
    //Configuarable
    @State var debug = 1.0
    @State private var showingPopover = false
    @State private var subject = "Subject"
    @State private var lengthField: String = "0"
    @State private var breakField: String = "0"
    
    @State var startingTime = 10
    @State var startingBreak = 5
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var minutes = "0"
    @State var seconds = "00"
    @State var minutesNext = "0"
    @State var secondsNext = "00"
    
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
    
    func sceneSwitcher(to str: String) {
        if (str == "start") {
            scene = "start"
            
            colorMode = "start"
            timerName = "Focused Study"
            buttonText = "Start"
            
            progress = 0
            timerRunning = false
            countdownBreak = startingBreak
            countdownTimer = startingTime
            
            dropdownDisabled = false
            
            withAnimation() {
                buttonOpacity = 0
                startOpacity = 1
                infoOpacity = 0
            }

        } else if (str == "timer") {
            scene = "timer"
            
            colorMode = "timer"
            timerName = "Focused Study"
            buttonText = "Pause"
            
            minutes = timerMinutes
            seconds = timerSeconds
            minutesNext = breakMinutes
            secondsNext = breakSeconds
            
            dropdownDisabled = true
            
            timerRunning = true
            
            withAnimation() {
                buttonOpacity = 1
                startOpacity = 0
                infoOpacity = 1
            }
        } else if (str == "interruption") {
            scene = "interruption"
            
            colorMode = "interruption"
            timerName = "Interruption"
            buttonText = "Resume"
            
            minutes = interruptionMinutes
            seconds = interruptionSeconds
            minutesNext = timerMinutes
            secondsNext = timerSeconds
            
            dropdownDisabled = true
            
            timerRunning = false
            
            withAnimation() {
                progress = 0
            }
            
        } else if (str == "break") {
            scene = "break"
            countdownTimer = startingTime
            
            colorMode = "break"
            timerName = "Break"
            buttonText = " "
            
            minutes = breakMinutes
            seconds = breakSeconds
            minutesNext = timerMinutes
            secondsNext = timerSeconds
            
            dropdownDisabled = true
            
            progress = 0
            timerRunning = true
            
            withAnimation() {
                buttonOpacity = 0
                startOpacity = 0
                infoOpacity = 1
            }
        } else {
            fatalError("Scene (\(scene)) is not defined.")
        }
    }
    
    func onStart() {
        countdownTimer = startingTime
        countdownBreak = startingBreak
        minutes = timerMinutes
        seconds = timerSeconds
    }
    
    /// Dynamic Function Colours
    func colorAsset(colorMode: String) -> Color {
        if (colorMode == "start") {
            return Color("StartColor")
        }
        else if (colorMode == "timer") {
            return Color("TimerColor")
        }
        else if (colorMode == "interruption") {
            return Color("InterruptionColor")
        }
        else if (colorMode == "break"){
            return Color("BreakColor")
        }
        else {
            return Color.black
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {

            //Settings
            Button(subject){
                showingPopover = true
            }
            .padding(4)
            .foregroundColor(subjects[subjects.firstIndex(where: {$0.name == subject}) ?? 0].theme.accentColor)
            .background(subjects[subjects.firstIndex(where: {$0.name == subject}) ?? 0].theme.mainColor)
            .disabled(dropdownDisabled)
            .cornerRadius(4)
            .font(.system(size: 20))
            .sheet(isPresented: $showingPopover) {
                NavigationView {
                    Picker("", selection: $subject) {
                        ForEach($subjects) { $subject in
                            Text(subject.name).tag(subject.name)
                        }
                    }
                    .pickerStyle(.wheel)
                    .navigationTitle("Select Subject")
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showingPopover = false
                            }
                        }
                    }
                }


            }
            
            
            /// Timer
            ZStack {
                ///Information
                VStack {
                    Text(timerName)
                        .font(.system(size: 24))
                    
                    Text("\(minutes):\(seconds)").onReceive(timer) { _ in
                        //Timer Countdown
                        if (scene == "timer") {
                            if countdownTimer > 0 && timerRunning {
                                countdownTimer -= 1
                                withAnimation() {
                                    progress = 1 - CGFloat(Float(countdownTimer) / Float(startingTime))
                                }
                            } else { sceneSwitcher(to: "break") }
                            minutes = timerMinutes
                            seconds = timerSeconds
                            
                        }
                        
                        /// Break Countdown
                        else if (scene == "break") {
                            if countdownBreak > 0 && timerRunning {
                                countdownBreak -= 1
                                withAnimation() {
                                    progress = 1 - CGFloat(Float(countdownBreak) / Float(startingBreak))
                                }
                            } else {
                                sceneSwitcher(to: "start")
                                NavigationLink(destination: CompletedView(timeToAdd: 60, subject: subject))
                            }
                            minutes = breakMinutes
                            seconds = breakSeconds
                            
                        }
                        
                        /// Interruption Counter
                        else if (scene == "interruption") {
                            countdownInterruption += 1
                            minutes = interruptionMinutes
                            seconds = interruptionSeconds

                        }
                        

                    }
                    .font(.system(size: 72))
                    
                    HStack {
                        Image(systemName: "clock")
                            .font(.system(size: 24))
                        Text("\(minutesNext):\(secondsNext)")
                            .font(.system(size: 24))
                    }

                }
                .opacity(infoOpacity)
                
                ///Start Button
                Button(action: {
                    sceneSwitcher(to: "timer")
                }) {
                    ZStack {
                        Circle()
                            .stroke(colorAsset(colorMode: self.colorMode), lineWidth: 3)
                            .frame(width: 250, height: 250)
                        Text(buttonText)
                            .frame(width: 240, height: 240)
                            .foregroundColor(Color.black)
                            .background(colorAsset(colorMode: self.colorMode))
                            .clipShape(Circle())
                            .font(.system(size: 50, weight: .bold))
                    }
                }
                .opacity(startOpacity)

                
                CircularProgressBar(circleProgress: $progress, widthAndHeight: 300, staticColor: colorAsset(colorMode: self.colorMode), progressColor: .gray, showLabel: false)
                    .onAppear(perform: onStart)
            }
            .padding(.top, 20.0)
            

            /// MiniSummary and Button switiching zstack
            ZStack {
                /// Button
                Button(action: {
                    if (scene == "timer") {
                        sceneSwitcher(to: "interruption")
                        minutes = interruptionMinutes
                        seconds = interruptionSeconds
                    }
                    else if (scene == "interruption") {
                        sceneSwitcher(to: "timer")
                        minutes = timerMinutes
                        seconds = timerSeconds
                    }
                    
                    
                    }) {
                        ZStack {
                            Circle()
                                .stroke(colorAsset(colorMode: self.colorMode), lineWidth: 3)
                                .frame(width: 110, height: 110)
                            Text(buttonText)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.black)
                                .background(colorAsset(colorMode: self.colorMode))
                                .clipShape(Circle())
                        }
                    }
                    .opacity(buttonOpacity)
                
                /// Mini Summary
                MiniSummaryView(subject: subjects[subjects.firstIndex(where: {$0.name == subject}) ?? 0])
                    .opacity(1.0 - buttonOpacity)
                    .scaleEffect(0.9)
                    
            }
            
            
            
        }
        .onAppear() {
            subject = subjects[0].name
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView(subjects: .constant(Subjects.sampleData))
            
            
    }
}
