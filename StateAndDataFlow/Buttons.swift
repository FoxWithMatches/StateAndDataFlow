//
//  Buttons.swift
//  StateAndDataFlow
//
//  Created by Alisa Ts on 27.01.2022.
//

import SwiftUI

struct Buttons: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
        }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(title: "Start", color: .red, action: {})
    }
}
