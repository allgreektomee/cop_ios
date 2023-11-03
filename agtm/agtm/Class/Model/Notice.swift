//
//  Notice.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import Foundation

// MARK: - Notice
struct Notice: Codable, Hashable {
    let id: Int
    let owner: Owner
    let photos: [Photo]
    let createAt, updateAt, name, nameEn: String
    let type: String
    let url: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id, owner, photos
        case createAt = "create_at"
        case updateAt = "update_at"
        case name
        case nameEn = "name_en"
        case type
        case url = "URL"
        case description
    }
}

typealias NoticeList = [Notice]
