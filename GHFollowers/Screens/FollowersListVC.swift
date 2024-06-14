//
//  FollowersListVC.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 13/06/2024.
//

import UIKit

class FollowersListVC: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
