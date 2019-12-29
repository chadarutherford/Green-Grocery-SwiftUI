//
//  ContentView.swift
//  Green Grocery SwiftUI
//
//  Created by Chad Rutherford on 12/29/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    var usernameError: String = "Required"
    var emailError: String = "Not Valid"
    var passwordError: String = "Not Valid"
    var confirmPasswordError: String = "Not Valid"
    
    var body: some View {
        ZStack {
            ColorCodes.primary.color()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Green Grocery")
                    .font(Font.custom("Noteworthy-Bold", size: 40.0))
                    .foregroundColor(.white)
                    .padding(.bottom, 20.0)
                
                AuthTextField(title: "Username", textValue: $username, errorValue: usernameError)
                AuthTextField(title: "Email", textValue: $email, errorValue: emailError, keyboardType: .emailAddress)
                AuthTextField(title: "Password", textValue: $password, errorValue: passwordError, isSecured: true)
                AuthTextField(title: "Confirm Password", textValue: $confirmPassword, errorValue: confirmPasswordError, isSecured: true)
                
                Button(action: signUp) {
                    Text("Sign Up")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(.infinity)
                .padding(.top, 20.0)
                
            }.padding(60.0)
        }
    }
    
    func signUp() {
        print("Sign Up Clicked")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

extension ColorCodes {
    func color() -> Color {
        switch self {
        case .primary:
            return Color(r: 79, g: 139, b: 43)
        case .success:
            return Color(r: 0, g: 0, b: 0)
        case .failure:
            return Color(r: 219, g: 12, b: 12)
        case .background:
            return Color(r: 239, g: 243, b: 244)
        }
    }
}

extension Color {
    init(r: Double, g: Double, b: Double) {
        self.init(red: r / 255, green: g / 255, blue: b / 255)
    }
}
