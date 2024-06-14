//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 14/06/2024.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(
        title: String,
        message: String,
        actionBtnTitle: String
    ) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, btnTitle: actionBtnTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
