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
    var priceList = [Price]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.delegate = self
        dataManager.fetchBitcoinData()
    }

    func didUpdateBitcoin(prices: [String : Double]) {
        
        for price in prices {
            let priceElement = Price(date: price.key, price: price.value)
            priceList.append(priceElement)
        }
        
        print(priceList.count)
    }
    
    
    
}

