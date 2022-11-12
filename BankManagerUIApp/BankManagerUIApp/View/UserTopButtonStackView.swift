//
//  UserTopButtonStackView.swift
//  BankManagerUIApp

import UIKit

final class UserTopButtonStackView: UIStackView {
    private let addCustomerButton = UIButton(title: "고객 10명 추가")
    private let resetButton = UIButton(title: "초기화")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        addSubViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureStackView() {
        axis = .horizontal
        distribution = .fillEqually
    }
    
    private func addSubViews() {
        self.addArrangedSubview(addCustomerButton)
        self.addArrangedSubview(resetButton)
    }
}
