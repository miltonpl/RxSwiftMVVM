//
//  LoginViewController.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/30/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, ReusableController {
    typealias ObjectController = LoginViewController
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    private let loginViewModel = LoginViewModel()
    
    let disposeBag = DisposeBag()
    private var observerLoginButton: Observable<Void> {
        return self.loginButton.rx.tap.asObservable()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unableLoginButtonTapped()
        self.setupRxBinds()
    }
    
    func setupRxBinds() {
        self.usernameTextField
            .rx
            .text
            .map { $0 ?? ""}
            .bind(to: self.loginViewModel.usernameTextPublishedSubject)
            .disposed(by: self.disposeBag)
        self.passwordTextField
            .rx
            .text
            .map { $0 ?? ""}
            .bind(to: self.loginViewModel.passwordTextPublishedSubject)
            .disposed(by: self.disposeBag)
        
        self.loginViewModel
            .isValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
        self.loginViewModel
            .isValid.map { $0 ? 1 : 0.1}
            .bind(to: loginButton.rx.alpha)
            .disposed(by: disposeBag)
    }
    
    func unableLoginButtonTapped() {
        self.observerLoginButton
            .subscribe(onNext: {                
                let registerViewController = RegisterViewController.instantiate(name: .auth)
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.navigationController?.pushViewController(registerViewController, animated: true)
        }).disposed(by: self.disposeBag)
    }
}
