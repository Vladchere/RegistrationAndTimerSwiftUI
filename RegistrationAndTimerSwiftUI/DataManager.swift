//
//  DataManager.swift
//  RegistrationAndTimerSwiftUI
//
//  Created by Vladislav on 31.07.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    private let userDataKey = "userManager"
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(userData, forKey: userDataKey)
    }
    
    func loadUser() -> User {
        guard let userData = userDefaults.object(forKey: userDataKey) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: userDataKey)
    }
}
