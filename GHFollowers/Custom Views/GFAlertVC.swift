//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 13/06/2024.
//

import UIKit

class GFAlertVC: UIViewController {
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionBtn = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var btnTitle: String?
    
    let padding: CGFloat = 20
    
    init(alertTitle: String? = nil, message: String? = nil, btnTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.btnTitle = btnTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureMessageLabel()
        configureActionButton()
    }
}

private extension GFAlertVC {
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? ""
        messageLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(actionBtn)
        actionBtn.setTitle(btnTitle ?? "OK", for: .normal)
        actionBtn.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            actionBtn.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: padding),
            actionBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
