//
//  WorkTimeLabelStackView.swift
//  BankManagerUIApp

import UIKit

final class WorkTimeLabelStackView: UIStackView {
    private let titleLabel = UILabel(text: "업무 시간 -", alignment: .right)
    
    private let workTimeLabel = UILabel(text: " 00:00:000", alignment: .left)
    
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
        [
            titleLabel,
            workTimeLabel
        ].forEach {
            addArrangedSubview($0)
        }
    }
    
    func updateWorkTimeLabel(input: String) {
        workTimeLabel.text = input
    }
}
