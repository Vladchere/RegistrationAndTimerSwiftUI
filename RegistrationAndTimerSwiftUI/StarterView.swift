//
//  StarterView.swift
//  RegistrationAndTimerSwiftUI
//
//  Created by Vladislav on 31.07.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isRegistered {
                TimerView()
            } else {
                RegisterView()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
        .environmentObject(UserManager())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

