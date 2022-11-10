//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    private let userTopButtonView = UserTopButtonStackView()
    private let workTimeLabel = WorkTimeLabelStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        addSubViews()
        makeConstraintTopButtonView()
        makeConstraintWorkTimeLabel()
    }
    
    private func addSubViews() {
        [
            userTopButtonView,
            workTimeLabel
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
}
