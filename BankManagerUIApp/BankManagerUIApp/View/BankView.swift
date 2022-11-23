//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankView: UIView {
    private let userTopControlStackView = UserTopControlStackView()
    private let waitingLineScrollView = CustomerLineScrollView()
    private let workingLineScrollView = CustomerLineScrollView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addStackView()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addStackView() {
        [
            waitingLineScrollView,
            workingLineScrollView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func configureUI() {
        backgroundColor = .systemBackground
        addSubViews()
        makeConstraintControlView()
        makeConstraintWaitingView()
        makeConstraintWorkingView()
    }
    
    private func addSubViews() {
        [
            userTopControlStackView,
            waitingLineScrollView,
            workingLineScrollView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func makeConstraintControlView() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            userTopControlStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            userTopControlStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            userTopControlStackView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        ])
    }
    
    private func makeConstraintWaitingView() {
        NSLayoutConstraint.activate([
            waitingLineScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            waitingLineScrollView.trailingAnchor.constraint(equalTo: centerXAnchor),
            waitingLineScrollView.topAnchor.constraint(
                equalTo: userTopControlStackView.bottomAnchor,
                constant: 10
            ),
            waitingLineScrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func makeConstraintWorkingView() {
        NSLayoutConstraint.activate([
            workingLineScrollView.leadingAnchor.constraint(equalTo: centerXAnchor),
            workingLineScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            workingLineScrollView.topAnchor.constraint(
                equalTo: userTopControlStackView.bottomAnchor,
                constant: 10
            ),
            workingLineScrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func addWaitingPerson(customer: Customer) {
        waitingLineScrollView.inputCustomer(customer: customer)
    }
    
    func addWorkingPerson(customer: Customer) {
        waitingLineScrollView.popCustomer(customer: customer)
        workingLineScrollView.inputCustomer(customer: customer)
    }
    
    func popWorkingPerson(customer: Customer) {
        workingLineScrollView.popCustomer(customer: customer)
    }
    
    func updateWorkTimeLabel(input: String) {
        userTopControlStackView.updateWorkTimeLabel(input: input)
    }
}
