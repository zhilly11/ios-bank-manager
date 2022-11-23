//
//  BankViewController.swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

class BankViewController: UIViewController {
    let bankView = BankView()
    let bank: Bank = Bank()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        openBank()
        
        addObserveStartWork()
        addObserveEndWork()
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.0001,
            target: self,
            selector: #selector(timerValueChanged(_:)),
            userInfo: nil,
            repeats: true
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bank.startWork()
        
        bank.resetCustomerQueue()
    }
    
    @objc func timerValueChanged(_ timer: Timer) {
        bankView.updateWorkTimeLabel(input: timer.timeInterval.description)
    }
}

// MARK: Bank Method
private extension BankViewController {
    func openBank() {
        bank.createQueue()
        
        let customerCount: Int = Int.random(in: 10...30)
        
        for turn in 1...customerCount {
            guard let business = BankBusiness.allCases.randomElement() else { continue }
            let newCustomer: Customer = Customer(ticketNumber: turn, business: business)
            bank.addCustomer(customer: newCustomer)
            bankView.addWaitingPerson(customer: newCustomer)
        }
    }
}

// MARK: NotificationCenter Method
private extension BankViewController {
    func addObserveStartWork() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveOperationNotification(_:)),
            name: notificationName.start.notiName,
            object: nil
        )
    }
    
    func addObserveEndWork() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveOperationNotification(_:)),
            name: notificationName.end.notiName,
            object: nil
        )
    }
    
    @objc func didReceiveOperationNotification(_ noti: Notification) {
        guard let customer = noti.object as? Customer,
              let notiCase = notificationName(rawValue: noti.name.rawValue) else {
            return
        }
        
        switch notiCase {
        case .start:
            bankView.addWorkingPerson(customer: customer)
        case .end:
            bankView.popWorkingPerson(customer: customer)
        }
    }
}
