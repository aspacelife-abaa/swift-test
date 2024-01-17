//
//  SignupView.swift
//  swift-test
//

import UIKit

final class SignupView: BaseScrollView {
    
//    private let viewModel = LoginViewViewModel()
    var signinTapHandler: NoParamHandler?
    
    fileprivate let firstNameTextField = CustomTextField(title: Constants.FIRST_NAME, validationType: .name)
    fileprivate let lastNameTextField = CustomTextField(title: Constants.LAST_NAME, validationType: .name)
    fileprivate let emailTextField = CustomTextField(title: Constants.EMAIL_ADDRESS, placeholder: "someone@email.com", validationType: .email)
    fileprivate let phoneTextField = CustomPhoneNumberTextField()
    fileprivate let passwordTextField = CustomTextField(title: Constants.PASSWORD, placeholder: passwordPlaceholder, isPassword: true, validationType: .password)
    let stateTextField = CustomDropdownTextField(floatingText: Constants.STATE)
    fileprivate let referralCodeTextField = CustomTextField(title: Constants.REFERRAL_CODE_OPTION, validationType: .alphaNumeric)
    private let consentCheckbox = Checkbox(isChecked: false)
    private let consentLabel = UILabel(text: Constants.SIGN_UP_CONSENT,
                                       font: .avenirRegular(size: 14),
                                       numberOfLines: 0,
                                       color: .primaryTextColor,
                                       alignment: .left,
                                       adjustsFontSizeToFitWidth: false)
    private lazy var consentStackView = HorizontalStackView(arrangedSubviews: [consentCheckbox, consentLabel], spacing: 10, alignment: .top)
    
    fileprivate lazy var signUpButton: CustomButton = {
        CustomButton(title: Constants.SIGN_UP, textColor: .white, height: 50, isEnabled: false, tapAction: didTapSignUpButton)
    }()

    fileprivate lazy var signInButton = CustomButton(title: Constants.ALREADY_HAVE_ACCOUNT_SIGN_IN, backgroundColor: .clear, textColor: .primaryBlue, tapAction: handleSigninButtonTapped)
    
    fileprivate lazy var contentStackView = VerticalStackView(
        arrangedSubviews: [
            firstNameTextField,
            lastNameTextField,
            emailTextField,
            phoneTextField,
            passwordTextField,
            stateTextField,
            referralCodeTextField,
            consentStackView,
            signUpButton,
            signInButton
        ], spacing: 20
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported: init(coder:) has not been implemented")
    }
    
    override func addConstraints() {
        with(contentStackView) {
            _addSubview($0)
            _fillSuperview($0, padding: ._init(topBottom: 40, leftRight: 20))
            $0.setCustomSpacing(40, after: consentStackView)
        }
        consentCheckbox.addTarget(self, action: #selector(didTapConsentCheckbox), for: .valueChanged)
    }
    
    fileprivate func handleSigninButtonTapped() {
        signinTapHandler?()
    }
    
    private func didTapSignUpButton() {
        if [firstNameTextField, lastNameTextField, emailTextField, passwordTextField].areValid && phoneTextField.isValidNumber {
//            viewModel.signUp(firstName: firstNameTextField.text,
//                             lastName: lastNameTextField.text,
//                             email: emailTextField.text,
//                             phoneNumber: phoneTextField.fullNumber,
//                             password: passwordTextField.text,
//                             state: stateTextField.valueText,
//                             refCode: referralCodeTextField.text)
        }
    }
    
    @objc private func didTapConsentCheckbox() {
        signUpButton.enable(consentCheckbox.isChecked)
    }
}
