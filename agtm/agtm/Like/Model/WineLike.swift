//
//  WineLike.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import Foundation

// MARK: - WineLike
struct WineLike: Codable, Hashable {
    let pk: Int
    let user: User
    let type: String
    let wine: Wine?
    let agtmclass: Agtmclass?
}

// MARK: - User
struct User: Codable, Hashable {
    let img, username, email: String
}

// MARK: - Agtmclass
struct Agtmclass: Codable, Hashable {
    let pk: Int
    let photos: [Photo]
    let title, subtitle: String
    let price: Int
}


typealias WineLikeList = [WineLike]
