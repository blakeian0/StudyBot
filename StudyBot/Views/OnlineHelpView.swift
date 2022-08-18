//
//  OnlineHelpView.swift
//  StudyBot
//
//  Created by Blake Buddingh on 18/8/2022.
//

import SwiftUI

struct OnlineHelpView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
            
                Text("Starting a Timer")
                    .font(.title)
                    
                
                Text("To start a timer, navigate to the Study Tab on the toolbar. \n\nSelect a subject by using the dropdown at the top of the screen.\n\nThen click the start button, this is when you start studying!\n\nAfter the timer is complete, a break timer will appear, this is when you rest before your next study session.")
                    .padding()
                
                
                Text("Pausing the Timer")
                    .font(.title)
                
                Text("To pause the timer, click the pause button, the timer will then start counting up to show how long the timer has been paused. \n\nWhen you are ready to resume, click the resume button.")
                    .padding()
                
                Text("Changing your Subjects")
                    .font(.title)
                
                Text("To change your subjects, navigate to the subject section in the Settings menu.\n\nTo modify a subject, click the subject you want to modify, and use the options to change the name, theme or goal of the subject. Tapping the red delete button will remove your subject completely. Remember to click save to complete your changes!\n\nTo add a subject, click the + at the top right of the subjects screen, and change the Name, Theme and Goal for your subject.")
                    .padding()
                
                Text("Changing Starting Study and Break Timers")
                    .font(.title)
                
                Text("To change your default study and break times, adjust them using the clock (study) and moon (break) icon in the Settings menu. \n\nRemember to click save to keep your changes!")
                    .padding()
                
                
            }
        }
        .navigationTitle("Online Help")
    }
}

struct OnlineHelpView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineHelpView()
    }
}
