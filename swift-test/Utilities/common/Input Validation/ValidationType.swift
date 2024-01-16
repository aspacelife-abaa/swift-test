//
//  ValidationType.swift
//  swift-test
//

import Foundation

enum ValidationType {
    case email, emailOrPhone, phoneNumber, password, confirmPassword, name, amount, numeric, address, mileage(Double), vin(Int)
    case requiredField, alphaNumeric
}
