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
        print(startBankWork())        
    }
    
    func openBank() {
        bank.createQueue()
        
        let customerCount: Int = Int.random(in: 10...30)
        
        for turn in 1...customerCount {
            guard let business = BankBusiness.allCases.randomElement() else { continue }
            let newCustomer: Customer = Customer(ticketNumber: turn, business: business)
            self.bank.addCustomer(customer: newCustomer)
            print(bank)
        }
    }
    
    func startBankWork() -> ReportData {
        return measureTime {
            bank.startWork()
        }
    }
    
    func closeBank() {
        bank.resetCustomerQueue()
    }
    
    func measureTime(_ closure: () -> (Int)) -> ReportData {
        let startDate = Date()
        let userCount = closure()
        return (userCount, Date().timeIntervalSince(startDate))
    }
}
