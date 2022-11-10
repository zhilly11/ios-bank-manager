//
//  UserTopButtonStackView.swift
//  BankManagerUIApp

import UIKit

class UserTopButtonStackView: UIStackView {
    let addCustomerButton : UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        return button
    }()
    
    let resetButton : UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addSubViews() {
        self.addArrangedSubview(addCustomerButton)
        self.addArrangedSubview(resetButton)
    }
}

