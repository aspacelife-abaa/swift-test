//
//  Constants.swift
//  swift-test
//

import Foundation
import UIKit

struct Constants {
    static let DATA_NOT_FOUND = "No Data Found!"
    static let TITLE = "Title"
    static let REQUIRED = "Required"
    static let YES = "Yes"
    static let NO = "No"
    static let NO_POSTS_FOUND = "No posts found"
    static let POSTS = "Posts"
    static let FORGOT_PASSWORD = "Forgot Password"
    static let SIGN_IN = "Sign In"
    static let SIGN_UP = "Sign Up"
    static let CHOOSE = "Choose"
    static let PASSWORD = "Password"
    static let EMAIL_OR_PHONENUMBER = "Email or Phone Number"
    static let WELCOME_BACK = "Welcome back!"
    static let SIGN_IN_TO_CONTINUE = "Sign in to continue"
    static let DONT_HAVE_ACCOUNT_SIGN_UP = "Don't have an account? Sign Up"
    static let ALREADY_HAVE_ACCOUNT_SIGN_IN = "Already have an account? Sign In"
    static let CREATE_ACCOUNT = "Create Account"
    static let FIRST_NAME = "First Name"
    static let LAST_NAME = "Last Name"
    static let EMAIL_ADDRESS = "Email Address"
    static let PHONE_NUMBER = "Phone Number"
    static let CHOOSE_FILE = "Choose File"
    static let STATE = "State"
    static let CANNOT_BE_EMPTY = "Cannot be empty"
    static let REFERRAL_CODE_OPTION = "Referral Code (Optional)"
    static let SIGN_UP_CONSENT = "I consent to this app using my details to create my account.";
    
    static func getCurrency() -> String { "" }
    
    static func COUNTRY_FLAG(code: String = phoneCode()) -> UIImage? {
        switch code {
        case "+254", "KE":
            return UIImage()
        case "+233", "GH":
            return UIImage()
        case "+256", "UG":
            return UIImage()
        case "+225", "CI":
            return UIImage()
        default:
            return UIImage(named: "nigeria")
        }
    }
    
    static func phoneCode(countryCode: String = "") -> String {
        switch countryCode {
        case "GH":
            return "+233"
        case "KE":
            return "+254"
        case "CI":
            return "+255"
        case "UG":
            return "+256"
        default:
            return "+234"
        }
    }
}
