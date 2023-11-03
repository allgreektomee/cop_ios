//
//  ClassDetail.swift
//  agtm
//
//  Created by yujin on 2023/10/16.
//

import Foundation

// MARK: - ClassDetail
struct ClassDetail: Codable {
    let id: Int
    let owner: Owner
    let photos: [Photo]
    let isLiked: Bool
    let createAt, updateAt, title, subtitle: String
    let description, place, address: String
    let price: Int
    let start, end: String
    let headcount: Int

    enum CodingKeys: String, CodingKey {
        case id, owner, photos
        case isLiked = "is_liked"
        case createAt = "create_at"
        case updateAt = "update_at"
        case title, subtitle, description, place, address, price, start, end, headcount
    }
}
