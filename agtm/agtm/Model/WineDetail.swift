//
//  WineDetail.swift
//  agtm
//
//  Created by yujin on 2023/10/10.
//

import Foundation

// MARK: - WineDetail
struct WineDetail: Codable, Hashable {
    let id: Int
    let grapes, region: Country
    let owner: Owner
    let country: Country
    let photos: [Photo]
    let isLiked, isOwner: Bool
    let pairings, styles: [Country]
    let createAt, updateAt, name, nameEn: String
    let type, wineRecommand: String
    let price: Int
    let isSoldout: Bool
    let description: String
    let alcohol: Double
    let tasteSugar, tasteAcidity, tasteTannin: Int
    let tasteBody: Int

    enum CodingKeys: String, CodingKey {
        case id, grapes, region, owner, country, photos
        case isLiked = "is_liked"
        case isOwner = "is_owner"
        case pairings, styles
        case createAt = "create_at"
        case updateAt = "update_at"
        case name
        case nameEn = "name_en"
        case type, wineRecommand, price
        case isSoldout = "is_soldout"
        case description
        case alcohol = "Alcohol"
        case tasteSugar = "taste_sugar"
        case tasteAcidity = "taste_acidity"
        case tasteTannin = "taste_tannin"
        case tasteBody = "taste_body"
    }
}

// MARK: - Owner
struct Owner: Codable, Hashable {
    let img, username, email: String
}
