//
//  LoginViewController.swift
//  LoginMVVMDemo
//
//  Created by `baps on 01/07/21.
//

import UIKit
import Foundation

protocol loginViewControllerDelegate {
    func getInformationBack(handledString : String?)
    
    func showErrorAlert(errorMessage : String)
}

class LoginViewController: UIViewController,loginViewControllerDelegate {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var bckView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set delegate
        viewModel.delegate = self
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        setBorderView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnLoginBtn(_ sender: Any) {
        
        viewModel.sendValue(from: emailTextField.text, password: passwordTextField.text)
    }
    
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        
//        let vc = Storyboards.Register.instantiateViewController(withIdentifier: "RegisterViewController")
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: false, completion: nil)
        
        if let registerViewController = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {

                    self.present(registerViewController, animated: true, completion: nil)
                }
    }
    
    func getInformationBack(handledString: String?) {
        // handledString
        let alert = UIAlertController(title: "Alert", message: handledString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(errorMessage: String) {
        //show Error
        let alert = UIAlertController(title: "Login", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
     func setBorderView() {
        
        imgLogo.layer.cornerRadius = 5.0
        // emailTextField.layer.cornerRadius = 5.0
        // emailTextField.layer.borderWidth = 1
        // emailTextField.clipsToBounds = true
    }
   
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        emailTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

