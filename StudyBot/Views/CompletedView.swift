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
    @Binding var subjects: [Subjects]
    var times: [Int]
    var subject: Subjects
    var numbery: Float = 0.2
    @State var data = Subjects.Data()
    
    func convertToMin(seconds: Int) -> String{
        var oneDecimal = String(format: "%.1f", (Float(seconds)/60))
    
        if (oneDecimal.suffix(2) == ".0") {
            oneDecimal.removeLast(2)
        }
        
        return oneDecimal
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                List {
                    HStack {
                        /// The icon on the left, showing minutes studied
                        ZStack {
                            Circle()
                                .strokeBorder(.black, lineWidth: 5)
                                .background(Circle().fill(.green))
                                .frame(width: 75, height: 75)
                                .padding()
                            
                            VStack {
                                Text(convertToMin(seconds: times[0]))
                                    .font(.title)
                                    .fontWeight(.heavy)
                                
                                Text("min")
                            }

                        }
                        
                        
                        
                        Divider().frame(height: 100)
                        
                        VStack {
                            Text("Another \(convertToMin(seconds: times[0])) minutes added to your study for \(subject.name). Keep it up!")
                                
                        
                        }
                        
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .strokeBorder(.black, lineWidth: 5)
                                .background(Circle().fill(.blue))
                                .frame(width: 75, height: 75)
                                .padding()
                            
                            VStack {
                                Text(convertToMin(seconds: times[3]))
                                    .font(.title)
                                    .fontWeight(.heavy)
                                
                                Text("min")
                            }

                        }
                        
                        Divider().frame(height: 100)
                        
                        Text("You had a \(convertToMin(seconds: times[3])) minute break, hope you enjoyed it!")
                            
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .strokeBorder(.black, lineWidth: 5)
                                .background(Circle().fill(.red))
                                .frame(width: 75, height: 75)
                                .padding()
                            
                            VStack {
                                Text(convertToMin(seconds: times[1]))
                                    .font(.title)
                                    .fontWeight(.heavy)
                                
                                Text("min")
                            }

                        }
                        
                        Divider().frame(height: 100)
                        
                        if (convertToMin(seconds: times[1]) == "0") {
                            Text("You weren't interrupted this study session, nice work!")
                                
                        } else {
                        
                        Text("You were interrupted for a total of \(convertToMin(seconds: times[1])) minutes. Lets get this number down!")
                            
                        }
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            data = subject.data
                            data.completed = (Float(convertToMin(seconds: times[0])) ?? 0)/60
                            subjects[subjects.firstIndex(where: {$0 == subject}) ?? 0].update(from: data)
                            print(subjects)
                            
                            presentationMode.wrappedValue.dismiss()
                        }) {
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
        CompletedView(subjects: .constant(Subjects.sampleData), times: [(15*60), (2*60), (30*60), (5*60)], subject: Subjects.sampleData[0])
    }
}
