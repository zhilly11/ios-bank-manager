//
//  UIButton + .swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .preferredFont(forTextStyle: .body)
    }
}
