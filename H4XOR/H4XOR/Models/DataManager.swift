//
//  DataManager.swift
//  H4XOR
//
//  Created by niBVL on 17/10/2021.
//

import Foundation

class DataManager: ObservableObject {
    
    let baseURL = "https://hn.algolia.com/api/v1/search?tags=front_page"
    @Published var posts = [Post]()
    
    func fetchData() {
        if let safeURL = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeURL) { (data, urlResponse, error) in
                if let safeError = error {
                    print("-----------------------")
                    print(safeError)
                    print("-----------------------")
                }
                else {
                    print(data ?? "afasfasfasd")
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            print(safeData)
                            let postDatas = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = postDatas.hits
                            }
                        } catch  {
                            print("-----------------------")
                            print(error)
                            print("-----------------------")
                        }
                        
                    }
                }
            }
            task.resume()
        }

    }
}


