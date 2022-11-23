//
//  UserTopControlStackView.swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

final class UserTopControlStackView: UIStackView {
    let userTopButtonView = UserTopButtonStackView()
    let workTimeLabel = WorkTimeLabelStackView()
    let queueLabel = QueueLabelStackView()
    
    init() {
        super.init(frame: .zero)
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureStackView() {
        distribution = .fillEqually
        axis = .vertical
        spacing = 10
        
        [
            userTopButtonView,
            workTimeLabel,
            queueLabel
        ].forEach {
            addArrangedSubview($0)
        }
    }
    
    func updateWorkTimeLabel(input: String) {
        workTimeLabel.updateWorkTimeLabel(input: input)
    }
}
