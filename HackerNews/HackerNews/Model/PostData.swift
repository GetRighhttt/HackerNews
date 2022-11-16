//
//  PostData.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import Foundation
// json response models
struct Results : Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // decodable must have ID, but the json response has an ID already. so we return objectID for ID.
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String? // must be optional or will return an error
}
