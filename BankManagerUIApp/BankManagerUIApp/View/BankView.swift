//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankView: UIView {
    private let userTopButtonView = UserTopButtonStackView()
    private let workTimeLabel = WorkTimeLabelStackView()
    private let queueLabel = QueueLabelStackView()
    
    private let stackView: UIStackView = {
        let waitingLineScrollView = CustomerLineScrollView()
        let workingLineScrollView = CustomerLineScrollView()
        
        let stackView = UIStackView(
            arrangedSubviews: [
                waitingLineScrollView,
                workingLineScrollView
            ]
        )
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI() {
        backgroundColor = .systemBackground
        addSubViews()
        makeConstraintTopButtonView()
        makeConstraintWorkTimeLabel()
        makeConstraintQueueLabel()
        makeConstraintStackView()
    }
    
    private func addSubViews() {
        [
            userTopButtonView,
            workTimeLabel,
            queueLabel,
            stackView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func makeConstraintTopButtonView() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            userTopButtonView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userTopButtonView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            userTopButtonView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func makeConstraintWorkTimeLabel() {
        NSLayoutConstraint.activate([
            workTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            workTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            workTimeLabel.topAnchor.constraint(equalTo: userTopButtonView.bottomAnchor, constant: 8)
        ])
    }
    
    private func makeConstraintQueueLabel() {
        NSLayoutConstraint.activate([
            queueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            queueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            queueLabel.topAnchor.constraint(equalTo: workTimeLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func makeConstraintStackView() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: queueLabel.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func requireUpdateTime(input: String) {
        workTimeLabel.updateWorkTimeLabel(input: input)
    }
}
