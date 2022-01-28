//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text("\(userManager.user.name.count)")
                    .foregroundColor(userManager.isValid ? .green : .red)
                    .padding()
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!self.userManager.isValid)
        }
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegister.toggle()
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
