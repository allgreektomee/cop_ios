//
//  PostReview.swift
//  agtm
//
//  Created by yujin on 2023/10/25.
//

import Foundation

// MARK: - ReviewData
struct ReviewData: Codable {
    let pk: Int
    let comment: String
    let rating: Int
}
