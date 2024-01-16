//
//  ResponseViewController.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 05/01/2022.
//

import UIKit

class ResponseViewController: UIViewController {
    
    var config: ResponseConfig!
    var responseHandler: NoParamHandler?
    
//    fileprivate let iconImageView = UIImageView(image: R.image.success_icon(), size: 120)
//    fileprivate let titleLabel = UILabel(text: "", font: .avenirExtraBold(size: 22), color: .primaryTextColor)
//    fileprivate let messageLabel = UILabel(text: "", numberOfLines: 0)
//    fileprivate lazy var actionButton: ACButton = {
//        ACButton(title: config.actionText, height: 50, tapAction: handleActionButtonTapped)
//    }()
//    fileprivate lazy var contentStackView: VerticalStackView = {
//        VerticalStackView(arrangedSubviews: [iconImageView, titleLabel, messageLabel], spacing: 10, alignment: .center)
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
//        addSubviews(contentStackView, actionButton)
//        contentStackView.anchor(top: safeAreaTopAnchor, leading: safeAreaLeadingAnchor, trailing: safeAreaTrailingAnchor, padding: ._init(top: 60, left: 20, right: 20))
//        actionButton.anchor(top: contentStackView.bottomAnchor, leading: safeAreaLeadingAnchor, trailing: safeAreaTrailingAnchor, padding: ._init(top: 60, left: 20, right: 20))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        configureNavBar(centerImage: R.image.autocheck_logo_yellow_icon(), barTintColor: .aLabel, tintColor: .aLabel, height: 28)
        setBackButtonText()
        showBackButton(false)
    }
    
    fileprivate func handleActionButtonTapped() {
        responseHandler?()
    }

}
