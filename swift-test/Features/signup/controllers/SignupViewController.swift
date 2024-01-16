//
//  SignupViewController.swift
//  swift-test
//

import UIKit

final class SignupViewController: UIViewController {
    
    private let signupView = SignupView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        loginView.forgotPasswordTapHandler = { [weak self] in
//            
//        }
//        
//        loginView.signinTapHandler = { [weak self] email, password in
////            self?.viewModel.signin(email: email, password: password)
//        }
//        
        signupView.signinTapHandler = showSignUpViewController
    }
    
    private func setupUI() {
        title = "Create Account"
        view.backgroundColor = .systemBackground
        
        view.addSubview(signupView)
        addConstraints()
    }
    
    private func addConstraints() {
//        loginView.delegate = self
        signupView.anchor(top: safeAreaTopAnchor, leading: safeAreaLeadingAnchor, bottom: safeAreaBottomAnchor, trailing: safeAreaTrailingAnchor)
    }
    
    private func showSignUpViewController() {
        setViewControllers(using: SigninViewController())
    }
}
