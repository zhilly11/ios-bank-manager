//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    private let userTopButtonView = UserTopButtonStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        addSubViews()
        makeConstraintTopButtonView()
    }
    
    private func addSubViews() {
        [
            userTopButtonView
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
}

