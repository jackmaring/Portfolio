//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, price: Double)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let btcURL = "\(baseURL)\(currency)"
        performRequest(with: btcURL)
    }
    
    func getCoinPrice(for row: Int) {
        let btcURL = "\(baseURL)\(currencyArray[row])"
        performRequest(with: btcURL)
    }
    
    var delegate: CoinManagerDelegate?
    
    func performRequest(with urlString: String) {
        // 1. create URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let price = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePrice(self, price: price)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let btcPrice = decodedData.last
            return btcPrice
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
