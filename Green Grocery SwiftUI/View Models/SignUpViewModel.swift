//
//  SignUpViewModel.swift
//  Green Grocery SwiftUI
//
//  Created by Chad Rutherford on 12/29/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Combine
import Foundation

class SignUpViewModel: ObservableObject {
    
    private var cancellableBag = Set<AnyCancellable>()
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    var usernameError: String = ""
    var emailError: String = ""
    var passwordError: String = ""
    var confirmPasswordError: String = ""
    
    private var userNameValidPublisher: AnyPublisher<Bool, Never> {
        return $username
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    init() {
        userNameValidPublisher.receive(on: RunLoop.main)
            .dropFirst()
            .map { $0 ? "" : "Username is missing"}
            .assign(to: \.usernameError, on: self)
            .store(in: &cancellableBag)
    }
}
