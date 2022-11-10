//
//  CustomerLineScrollView.swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

class CustomerLineScrollView: UIScrollView {
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        
        for _ in 0...20 {
            let label = UILabel()
            
            label.text = "example"
            label.textColor = .label
            label.textAlignment = .center
            label.font = .preferredFont(forTextStyle: .title3)
            label.adjustsFontForContentSizeCategory = true
            stackView.addArrangedSubview(label)
        }
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            contentStackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor, multiplier: 0.99999),
            contentStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.99999)
        ])
    }
}
