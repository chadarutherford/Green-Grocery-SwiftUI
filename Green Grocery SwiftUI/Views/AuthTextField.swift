//
//  AuthTextField.swift
//  Green Grocery SwiftUI
//
//  Created by Chad Rutherford on 12/29/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct AuthTextField: View {
    
    var title: String
    @Binding var textValue: String
    var errorValue: String
    var isSecured: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            if isSecured {
                SecureField(title, text: $textValue)
                    .padding()
                    .background(ColorCodes.background.color())
                    .cornerRadius(5)
                    .keyboardType(keyboardType)
            } else {
                TextField(title, text: $textValue)
                    .padding()
                    .background(ColorCodes.background.color())
                    .cornerRadius(5)
                    .keyboardType(keyboardType)
            }
            
            Text(errorValue)
                .fontWeight(.light)
                .foregroundColor(ColorCodes.failure.color())
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(title: "Username", textValue: Binding<String>.constant(""), errorValue: "Required")
    }
}
