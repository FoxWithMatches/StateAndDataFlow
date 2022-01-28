//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Alisa Ts on 28.01.2022.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func decodeUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func logOutUser(userManager: UserManager) {
        userManager.user.isRegister = false
        userManager.user.name = ""
        userData = nil
    }
}
