//
//  QueueLabelStackView.swift
//  BankManagerUIApp

import UIKit

class QueueLabelStackView: UIStackView {
    private let waitingLabel = UILabel(
        text: "대기중",
        alignment: .center,
        font: .preferredFont(forTextStyle: .title1),
        backgroundColor: .systemGreen,
        textColor: .white
    )
    
    private let workingLabel = UILabel(
        text: "업무중",
        alignment: .center,
        font: .preferredFont(forTextStyle: .title1),
        backgroundColor: .systemIndigo, textColor: .white
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        addSubViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: UI Configure Method
private extension QueueLabelStackView {
    func configureStackView() {
        axis = .horizontal
        distribution = .fillEqually
    }
    
    func addSubViews() {
        [
            waitingLabel,
            workingLabel
        ].forEach {
            addArrangedSubview($0)
        }
    }
    
}
