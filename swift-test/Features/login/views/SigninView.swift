//
//  LoginView.swift
//  swift-test
//

import UIKit

final class SigninView: BaseScrollView {
    
//    private let viewModel = LoginViewViewModel()
    
    var forgotPasswordTapHandler: NoParamHandler?
    var signinTapHandler: DoubleStringParamHandler?
    var signupTapHandler: NoParamHandler?
    
    fileprivate let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    fileprivate let welcomeLabel = UILabel(text: Constants.WELCOME_BACK, font: .avenirExtraBold(size: 30), color: .aLabel, alignment: .left)
    fileprivate let signInLabel = UILabel(text: Constants.SIGN_IN_TO_CONTINUE, font: .avenirRegular(size: 16), color: .aLabel, alignment: .left)
    fileprivate let emailTextField = CustomTextField(title: Constants.EMAIL_OR_PHONENUMBER, placeholder: "someone@email.com", validationType: .emailOrPhone)
    fileprivate let passwordTextField = CustomTextField(title: Constants.PASSWORD, placeholder: passwordPlaceholder, isPassword: true, validationType: .password)
    
    fileprivate lazy var labelStackView: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [welcomeLabel, signInLabel], spacing: 4)
    }()
    
    fileprivate lazy var inputStackView: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [emailTextField, passwordTextField], spacing: 20)
    }()
    
    fileprivate lazy var forgotPasswordButton: CustomButton = {
        CustomButton(title: Constants.FORGOT_PASSWORD+"?", font: .avenirRegular(size: 16), backgroundColor: .clear, textColor: .primaryBlue, tapAction: handleForgotPasswordButtonTapped)
    }()
    
    fileprivate lazy var signInButton: CustomButton = {
        CustomButton(title: Constants.SIGN_IN, textColor: .white, height: 50, tapAction: handleSignInButtonTapped)
    }()
    
    fileprivate lazy var signUpButton = CustomButton(title: Constants.DONT_HAVE_ACCOUNT_SIGN_UP, backgroundColor: .clear, textColor: .primaryBlue, tapAction: handleSignupButtonTapped)
    fileprivate lazy var buttonStackView = VerticalStackView(arrangedSubviews: [signInButton, signUpButton], spacing: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
//        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported: init(coder:) has not been implemented")
    }
    
    override func addConstraints() {
        _addSubviews(spinner, labelStackView, inputStackView, forgotPasswordButton, buttonStackView)
        spinner.do {
            $0.centerXInSuperview()
            $0.centerYInSuperview()
            $0.constraintSize(height: 100, width: 100)
        }
        
        labelStackView.do {
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 60, left: 20, right: 20))
        }
        
        inputStackView.do {
            $0.anchor(top: labelStackView.bottomAnchor, leading: labelStackView.leadingAnchor, trailing: labelStackView.trailingAnchor, padding: ._init(top: 30))
        }
        
        forgotPasswordButton.do {
            $0.anchor(top: inputStackView.bottomAnchor, leading: labelStackView.leadingAnchor, padding: ._init(top: 10))
        }
//
        buttonStackView.do {
            $0.anchor(top: forgotPasswordButton.bottomAnchor, leading: labelStackView.leadingAnchor, trailing: labelStackView.trailingAnchor, padding: ._init(top: 20))
        }
    }
    
    fileprivate func handleForgotPasswordButtonTapped() {
        forgotPasswordTapHandler?()
    }

    fileprivate func handleSignupButtonTapped() {
        signupTapHandler?()
    }
    
    fileprivate func handleSignInButtonTapped() {
        if [emailTextField, passwordTextField].areValid {
            signinTapHandler?(emailTextField.text, passwordTextField.text)
        }
    }
}
