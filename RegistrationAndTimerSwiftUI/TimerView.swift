//
//  TimerView.swift
//  RegistrationAndTimerSwiftUI
//
//  Created by Vladislav on 31.07.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
            
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                StartButton(timer: timer)
                Spacer()
                LogOutButton(isRegistered: $userManager.user.isRegistered, userName: $userManager.user.name)
            }
        }
    }
}


struct StartButton: View {
    
    @ObservedObject var timer: TimeCounter
        
    var body: some View {
        Button(action: { self.timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .buttonAppearance(Color.red)
    }
}

struct LogOutButton: View {
    
    @Binding var isRegistered: Bool
    @Binding var userName: String
    
    var body: some View {
        Button(action: userLogOut) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .buttonAppearance(Color.blue)
    }
    
    private func userLogOut() {
        isRegistered = false
        userName = ""
        DataManager.shared.clear()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
        .environmentObject(UserManager())
    }
}
