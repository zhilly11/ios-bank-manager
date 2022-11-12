//
//  BankOperationProcessing.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import Foundation

enum notificationName: String {
    case start
    case end
    
    var notiName: Notification.Name {
        return Notification.Name(rawValue: self.rawValue)
    }
}

protocol BankOperationProcessing {
    var customer: Customer { get }
    
    func work(customer: Customer)
}

extension BankOperationProcessing {
    func work(customer: Customer) {
        NotificationCenter.default.post(
            name: notificationName.start.notiName,
            object: customer
        )
        
        Thread.sleep(forTimeInterval: customer.business.businessTime)
        
        NotificationCenter.default.post(
            name: notificationName.end.notiName,
            object: customer
        )
    }
}
