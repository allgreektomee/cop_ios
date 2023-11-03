//
//  Class.swift
//  agtm
//
//  Created by yujin on 2023/10/10.
//

import Foundation

// MARK: - Class
struct Class: Decodable, Hashable {
    let pk: Int
    let title, subtitle, place, address: String
    let price: Int
    let start, end: String
    let owner: Owner
    let photos: [Photo]
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case pk, title, subtitle, place, address, price, start, end, owner, photos
        case isLiked = "is_liked"
    }
}

typealias ClassList = [Class]
