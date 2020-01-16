//
//  BitcoinDataManager.swift
//  CoreDataTest
//
//  Created by Manuel Carvalho on 16/1/20.
//  Copyright © 2020 Manuel Carvalho. All rights reserved.
//

import Foundation
import CoreLocation

protocol  BitcoinDataManagerDelegate {
    func didUpdateBitcoin(prices: [String: Double])
}

struct BitcoinDataManager {
    //let bitcoinURL = "https://api.coindesk.com/v1/bpi/currentprice.json"
    let bitcoinURL = "https://api.coindesk.com/v1/bpi/historical/close.json"
    var delegate: BitcoinDataManagerDelegate?
    
    func fetchBitcoinData(){
       
        performRequest(urlString: bitcoinURL)
    }
    
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(bitcoinData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(bitcoinData: Data){
        
        do {
            if let json = try JSONSerialization.jsonObject(with: bitcoinData, options: []) as? [String: Any] {
                // try to read out a string array
                if let values = json["bpi"] as? [String: Double] {
                    
                    self.delegate?.didUpdateBitcoin(prices: values)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }
    
    
}

