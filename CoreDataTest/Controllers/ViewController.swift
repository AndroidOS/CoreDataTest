//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Manuel Carvalho on 16/1/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BitcoinDataManagerDelegate {
    
    var dataManager = BitcoinDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.delegate = self
        dataManager.fetchBitcoinData()
    }


    func didUpdateBitcoin() {
        print("didUpdateBitcoin")
    }
}

