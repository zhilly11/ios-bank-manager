//
//  BankViewController.swift
//  BankManagerUIApp
//
//  Copyright (c) 2022 Minii All rights reserved.
        
import UIKit

class BankViewController: UIViewController {
    
    let bankView = BankView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = bankView
    }
}
