//
//  Wine.swift
//  agtm
//
//  Created by yujin on 2023/10/06.
//

import Foundation

// MARK: - Wine
struct Wine: Codable, Hashable {
    let pk: Int
    let photos: [Photo]
    let name, nameEn, type: String
    let price: Int
    let isSoldout: Bool?
    let owner: Int?
    let alcohol: Double?
    let country: Country?
    let isOwner, isLiked: Bool?

    enum CodingKeys: String, CodingKey {
        case pk, photos, name
        case nameEn = "name_en"
        case type, price
        case isSoldout = "is_soldout"
        case owner
        case alcohol = "Alcohol"
        case country
        case isOwner = "is_owner"
        case isLiked = "is_liked"
    }
}

// MARK: - Country
struct Country: Codable, Hashable {
    let pk: Int
    let name: String
    let description: String?
}


// MARK: - Photo
struct Photo: Codable, Hashable {
    let pk: Int
    let file: String
    let description: String
}

typealias wineList = [Wine]
