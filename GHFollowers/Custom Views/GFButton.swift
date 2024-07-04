//
//  GFButton.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 13/06/2024.
//

import UIKit

class GFButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // handle init for storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
}

private extension GFButton {
    func configure() {
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
