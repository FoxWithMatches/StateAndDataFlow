//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import Combine
import Foundation

class UserManager: ObservableObject {

    @Published var user = User()
    var isValid: Bool {
        user.name.count >= 3
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {}
    init(user: User) {
        self.user = user
    }
    
}
struct User {
    var name = ""
    var isRegister = false
}
