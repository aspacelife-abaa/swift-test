//
//  ACDropdownTextfield.swift
//  swift-test
//

import Foundation
import UIKit
//import DropDown

public class ACDropdownTextField: BaseView {
    
    private let hintText: String = Constants.CHOOSE
    
    private let floatingLabel = UILabel(text: Constants.TITLE, font: .avenirRegular(size: 14), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    private lazy var valueLabel = UILabel(text: hintText, font: .avenirRegular(size: 15), numberOfLines: 1, color: .aPlaceholderText, alignment: .left)
    let errorLabel = UILabel(text: Constants.REQUIRED, font: .avenirRegular(size: 13), numberOfLines: 0, color: .systemRed, alignment: .left)
    
    lazy var containerView = UIView().apply {
        $0.borderColor = .primaryTextColor.withAlphaComponent(0.7)
        $0.viewBorderWidth = 1
        $0.viewCornerRadius = 6
        $0.constraintHeight(constant: 50)
        $0.addSubview(containerChildStackView)
        containerChildStackView.anchor(top: nil, leading: $0.leadingAnchor, bottom: nil, trailing: $0.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))
        containerChildStackView.centerYInSuperview()
    }
    private let iconImageView = UIImageView(image: UIImage(named: "arrow_down_icon"), tintColor: .primaryTextColor)
    private lazy var containerStackView = VerticalStackView(arrangedSubviews: [floatingLabel, containerView, errorLabel], spacing: 5)
    private lazy var containerChildStackView = HorizontalStackView(arrangedSubviews: [valueLabel, iconImageView], spacing: 10, alignment: .center)
    
//    private lazy var dropdownView = DropDown().apply {
//        $0.dataSource = selectionItems
//        $0.textFont = .avenirRegular(size: 16)
//        $0.selectionAction = { [weak self] index, value in
//            self?.valueText = value
//            self?.itemSelectionHandler?(value, index)
//        }
//    }
    
    var selectionItems = [String]() {
        didSet {
//            dropdownView.dataSource = selectionItems
        }
    }
    var itemSelectionHandler: StringIntParamHandler?
    
    public var floatingText: String {
        get { floatingLabel.text.orEmpty }
        set { floatingLabel.text = newValue }
    }
    
    public var valueText: String {
        get { valueLabel.text!.insensitiveContains([hintText, Constants.CHOOSE_FILE]) ? "" : valueLabel.text! }
        set {
            let valueCheck = newValue.isEmpty || newValue.insensitiveContains([hintText, Constants.CHOOSE_FILE])
            valueLabel.text = newValue
            valueLabel.textColor = valueCheck ? .aPlaceholderText : .aLabel
        }
    }
    
    public convenience init(floatingText: String,
                            valueText: String? = nil,
                            iconImage: UIImage? = UIImage(named: "arrow_down_icon"),
                            iconSize: CGFloat = 12
    ) {
        self.init(frame: .zero)
        setup()
        self.floatingText = floatingText
        self.valueText = valueText ?? hintText
        self.iconImageView.image = iconImage
        iconImageView.constraintSize(constant: iconSize)
    }
    
    convenience init(floatingText: String,
                     valueText: String? = nil,
                     iconSize: CGFloat = 12,
                     items: [String],
                     itemSelectionHandler: StringIntParamHandler? = nil
    ) {
        self.init(frame: .zero)
        setup()
        self.floatingText = floatingText
        self.valueText = valueText ?? hintText
        iconImageView.constraintSize(constant: iconSize)
        selectionItems = items
        self.itemSelectionHandler = { [weak self] value, index in
            self?.valueText = value
            itemSelectionHandler?(value, index)
        }
        animateViewOnTapGesture(completion: showItems)
    }
    
    private func showItems() {
//        dropdownView.apply {
//            $0.anchorView = containerView
//            $0.width = containerView.width
//            $0.show()
//        }
    }
    
    public override func setup() {
        super.setup()
        addSubview(containerStackView)
        containerStackView.fillSuperview()
        errorLabel.showView(false)
    }
    
    public var isValid: Bool {
        let valid = valueText.isNotEmpty
        showError(!valid)
        return valid
    }
    
    func showError(_ show: Bool = true) {
        errorLabel.showView(show)
        valueLabel.textColor = !show ? .aLabel : .systemRed
        containerView.do {
            $0.borderColor = !show ? .primaryTextColor.withAlphaComponent(0.7) : .systemRed
            if show {
                $0.shake(duration: 0.2)
            }
        }
    }
    
}
