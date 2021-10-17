//
//  NetworkManager.swift
//  H4XOR
//
//  Created by niBVL on 17/10/2021.
//

import Foundation


class NetworkManager {
    let baseURL = "http://hn.algolia.com/api/v1/search?tags=front_page"
    func fetchData()  {
        if let safeURL = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: safeURL) { data, urlResponse, error in
                if let safeError = error {
                    print("-----------------------")
                    print(safeError<##>)
                    print("-----------------------")
                }
                else {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        let postDatas  = decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: safeData)
                    }
                }
            }
        }

    }
}
