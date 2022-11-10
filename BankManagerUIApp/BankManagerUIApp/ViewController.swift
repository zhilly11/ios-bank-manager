//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        addSubViews()
        makeConstraintTopButtonView()
        makeConstraintWorkTimeLabel()
        makeConstraintQueueLabel()
//        makeConstraintWaitingScrollView()
//        makeConstraintWorkingScrollView()
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
            view.addSubview($0)
        }
    }
    
    private func makeConstraintTopButtonView() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            userTopButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTopButtonView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            userTopButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func makeConstraintWorkTimeLabel() {
        NSLayoutConstraint.activate([
            workTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            workTimeLabel.topAnchor.constraint(equalTo: userTopButtonView.bottomAnchor, constant: 8)
        ])
    }
    
    private func makeConstraintQueueLabel() {
        NSLayoutConstraint.activate([
            queueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            queueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            queueLabel.topAnchor.constraint(equalTo: workTimeLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func makeConstraintStackView() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: queueLabel.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
