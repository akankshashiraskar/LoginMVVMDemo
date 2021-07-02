//
//  LoginViewModel.swift
//  LoginMVVMDemo
//
//  Created by `baps on 02/07/21.
//

import Foundation
import UIKit

protocol loginViewModelDelegate {
    // this function is going to use for transfering the data from controller to view model
    func sendValue(from email: String?,password: String?)
}

class LoginViewModel : loginViewModelDelegate {
    
    // LoginViewModel Implementation
    var delegate: loginViewControllerDelegate?
    
    // set a call back to viewcontroller
    func sendValue(from email: String?, password: String?) {
        guard let emailTextField = email else {return}
        guard let passwordTextField = password else {return}
        delegate?.getInformationBack(handledString: "Login Successfull \(emailTextField)\(passwordTextField)")
    }
    
}


//Mark:- Use this code for using Observable

/* class LoginViewModel {
 //Mark:- Stored Properties
      
    private let loginManager: LoginManager
    
 // Used Model to notify that was updated
    private var credentials = Credentials() {
        didset {
            username = Credentials.username
            password = Credentials.password
        }
    }
    
    private var username = ""
    private var password = ""
    
    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isUsernameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    
    init(loginManager: LoginManager) {
            self.loginManager = loginManager
        }
    //Here we update our model
        func updateCredentials(username: String, password: String, otp: String? = nil) {
            credentials.username = username
            credentials.password = password
        }
    
    func login() {
        loginManager.loginWithCredentials(username: username, password: password) { [weak self] (error) in
            guard let error = error else {
                return
            }
            
            self?.errorMessage.value = error.localizedDescription
        }

    }
    
    func credentialsInput() -> CredentialsInputStatus {
            if username.isEmpty && password.isEmpty {
                credentialsInputErrorMessage.value = "Please provide username and password."
                return .Incorrect
            }
            if username.isEmpty {
                credentialsInputErrorMessage.value = "Username field is empty."
                isUsernameTextFieldHighLighted.value = true
                return .Incorrect
            }
            if password.isEmpty {
                credentialsInputErrorMessage.value = "Password field is empty."
                isPasswordTextFieldHighLighted.value = true
                return .Incorrect
            }
            return .Correct
        }
    
    ////
}

extension LoginViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
} */
