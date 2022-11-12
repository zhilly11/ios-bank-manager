//
//  UILabel +.swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

extension UILabel {
    convenience init(text: String, alignment: NSTextAlignment) {
        self.init()
        
        self.text = text
        self.textAlignment = alignment
    }
    
    convenience init(
        text: String,
        alignment: NSTextAlignment,
        font: UIFont,
        backgroundColor: UIColor = .white,
        textColor: UIColor = .black
    ) {
        self.init(text: text, alignment: alignment)
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}
