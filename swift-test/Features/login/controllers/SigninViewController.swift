//
//  ViewController.swift
//  swift-test
//

import UIKit

final class SigninViewController: UIViewController {
    
    private let signinView = SigninView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        signinView.forgotPasswordTapHandler = { [weak self] in
            
        }
        
        signinView.signinTapHandler = { [weak self] email, password in
//            self?.viewModel.signin(email: email, password: password)
        }
        
        signinView.signupTapHandler = showSignUpViewController
    }
    
    private func setupUI() {
        title = "Login"
        view.backgroundColor = .systemBackground
        
        view.addSubview(signinView)
        addConstraints()
    }
    
    private func addConstraints() {
//        loginView.delegate = self
        signinView.anchor(top: safeAreaTopAnchor, leading: safeAreaLeadingAnchor, bottom: safeAreaBottomAnchor, trailing: safeAreaTrailingAnchor)
    }
    
    private func showSignUpViewController() {
        setViewControllers(using: SignupViewController())
    }


}

