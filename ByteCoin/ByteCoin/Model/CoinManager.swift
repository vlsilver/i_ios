//
//  CoinManager.swift
//  ByteCoin
//
//  Created by niBVL on 14/10/2021.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(coinModel: CoinModel)
    func didErrorCoin(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4D1B0500-E440-4C7E-A997-957C5E7F4459"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func fetchCoinPrice(for currency: String)  {
        let urlString = baseURL + "/\(currency)" + "?apikey=\(apiKey)"
        perFormRequest(for: urlString)
        
    }
    
    func perFormRequest(for url: String)  {
        let url = URL(string: url)
        if let safeURL = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeURL) { data, response, error in
                if error != nil {
                    delegate?.didErrorCoin(error: error!)
                }
                if let safeData = data {
                    let coinModel = self.parseJON(data: safeData)
                    if let safeCoinModel = coinModel {
                        delegate?.didUpdateCoin(coinModel: safeCoinModel)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJON(data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let coinModel = try decoder.decode(CoinModel.self, from: data)
            return coinModel
        } catch  {
            delegate?.didErrorCoin(error: error)
            return nil
        }
        
        
    }
}
