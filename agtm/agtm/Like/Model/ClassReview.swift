//
//  ClassReview.swift
//  agtm
//
//  Created by yujin on 2023/10/24.
//

import Foundation

// MARK: - ClassReview
struct Review: Codable, Hashable {
    let pk: Int
    let user: User
    let comment: String
    let rating: Int
    let wine: Wine?
    let agtmclass: Agtmclass?
    let createAt, updateAt: String

    enum CodingKeys: String, CodingKey {
        case pk, user, comment, rating, wine, agtmclass
        case createAt = "create_at"
        case updateAt = "update_at"
    }
}

typealias ReviewList = [Review]
