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
    
    let waitingLineScrollView = CustomerLineScrollView()
    let workingLineScrollView = CustomerLineScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        addSubViews()
        makeConstraintTopButtonView()
        makeConstraintWorkTimeLabel()
        makeConstraintQueueLabel()
        makeConstraintWaitingScrollView()
        makeConstraintWorkingScrollView()
    }
    
    private func addSubViews() {
        [
            userTopButtonView,
            workTimeLabel,
            queueLabel,
            waitingLineScrollView,
            workingLineScrollView
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
    
    private func makeConstraintWaitingScrollView() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            waitingLineScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            waitingLineScrollView.topAnchor.constraint(equalTo: queueLabel.bottomAnchor),
            waitingLineScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            waitingLineScrollView.trailingAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func makeConstraintWorkingScrollView() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            workingLineScrollView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            workingLineScrollView.topAnchor.constraint(equalTo: queueLabel.bottomAnchor),
            workingLineScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            workingLineScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
