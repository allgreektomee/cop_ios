//
//  ClassLike.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import Foundation

// MARK: - ClassLike
struct ClassLike: Codable, Hashable {
    let pk: Int
    let user: User
    let type: String
    let wine: Wine?
    let agtmclass: Agtmclass
}

//// MARK: - Agtmclass
//struct Agtmclass: Codable {
//    let pk: Int
//    let photos: [Photo]
//    let title, subtitle: String
//    let price: Int
//}


typealias ClassLikeList = [ClassLike]
