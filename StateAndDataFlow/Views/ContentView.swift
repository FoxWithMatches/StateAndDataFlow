//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            Buttons(title: timer.buttonTitle,
                    color: .red,
                    action: timer.startTimer)
            Spacer()
            Buttons(title: "Log Out",
                    color: .blue) {
                    DataManager.shared.logOutUser(userManager: userManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

