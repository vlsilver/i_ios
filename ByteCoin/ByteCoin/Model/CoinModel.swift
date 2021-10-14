//
//  CoinModel.swift
//  ByteCoin
//
//  Created by niBVL on 14/10/2021.
//

import Foundation

struct CoinModel: Codable {
    let rate: Float
    let asset_id_quote: String
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
    
    var currency: String {
        return asset_id_quote
    }
}
