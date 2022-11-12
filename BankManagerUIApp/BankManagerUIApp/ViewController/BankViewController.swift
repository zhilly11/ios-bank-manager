//
//  BankViewController.swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.
        
import UIKit

typealias ReportData = (customerCount: Int, duringTime: TimeInterval)

class BankViewController: UIViewController {
    let bankView = BankView()
    let bank: Bank = Bank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = bankView
        openBank()
        
        addObserveStartWork()
        addObserveEndWork()
        

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startBankWork()
    }
    
    func openBank() {
        bank.createQueue()
        
        let customerCount: Int = Int.random(in: 10...30)
        
        for turn in 1...customerCount {
            guard let business = BankBusiness.allCases.randomElement() else { continue }
            let newCustomer: Customer = Customer(ticketNumber: turn, business: business)
            bank.addCustomer(customer: newCustomer)
            bankView.addNewCustomerView(customer: newCustomer)
        }
    }
    
    func startBankWork() {
        bank.startWork()
    }
    
    func closeBank() {
        bank.resetCustomerQueue()
    }
}

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
            bankView.popNewCustomerView(customer: customer)
            bankView.addNewWorkingCustomerView(customer: customer)
        case .end:
            bankView.popWorkingCustomerView(customer: customer)

        }
    }
}
