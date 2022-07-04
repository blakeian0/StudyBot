//
//  CompletedView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 1/7/22.
//

import SwiftUI

struct CompletedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // time is an array of 4 intergers [countdownTimer, interruptionTimer, startingTime, startingBreak]
    // it contains the time the user made it to, the total interrruptions and the initial time and break lengths
    var times: [Int]
    var subject: Subjects
    
    func convertToMin(temp: Int) -> String{
        let tempFloat = String(format: "%.1f", (temp/60))
        let tempString = String(format: "%g", tempFloat)
        return String((temp/60))
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                List {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.green)
                                .frame(width: 75, height: 75)
                                .padding()
                            
                            Text(String(Float(92/60)))
                        }
                        
                        
                        
                        Divider().frame(height: 100)
                        
                        VStack {
                            Text("\(times[0]) / \(times[2])")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("minutes of study completed.")
                        
                        }
                        
                    }
                    
                    HStack {
                        Circle()
                            .fill(.blue)
                            .frame(width: 75, height: 75)
                            .padding()
                        
                        Divider().frame(height: 100)
                        
                        Text("Congrats")
                            .padding()
                    }
                    
                    HStack {
                        Circle()
                            .fill(.red)
                            .frame(width: 75, height: 75)
                            .padding()
                        
                        Divider().frame(height: 100)
                        
                        Text("Congrats")
                            .padding()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {presentationMode.wrappedValue.dismiss()}) {
                            Text("Dismiss")
                                .padding()
                            
                        }
                        .background(Capsule()
                                        .stroke(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center), lineWidth: 4))
                        Spacer()
                    }
        
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
            .background(.white)
            .navigationTitle("Summary")
        }
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView(times: [90, 12, 60, 30], subject: Subjects.sampleData[0])
    }
}
