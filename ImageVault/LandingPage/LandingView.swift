//
//  LandingView.swift
//  ImageVault
//
//  Created by Vikash Hart on 10/30/22.
//

import UIKit

class LandingView: UIView {

    // MARK: - Objects
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "lock_image")?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Image Vault"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var passcodeTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.textColor = .white
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter passcode here to continue"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    // MARK: - Setup Methods
    private func commonInit() {
        self.backgroundColor = .black
        setupViews()
    }

    private func setupViews() {
        setupIcon()
        setupTitle()
        setupPasscodeField()
        setupInfoLabel()
    }

    // MARK: - Constraints

    private func setupIcon() {
        addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
            iconImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupTitle() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupPasscodeField() {
        addSubview(passcodeTextField)
        NSLayoutConstraint.activate([
//            passcodeTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
//            passcodeTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passcodeTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            passcodeTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            passcodeTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            passcodeTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setupInfoLabel() {
        addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: passcodeTextField.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
