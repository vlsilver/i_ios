//
//  PostData.swift
//  H4XOR
//
//  Created by niBVL on 17/10/2021.
//

import Foundation


struct PostData: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
