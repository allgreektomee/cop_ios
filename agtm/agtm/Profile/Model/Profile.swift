//
//  Profile.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import Foundation

// MARK: - Profile
struct Profile: Codable {
    let lastLogin: String?
    let username, firstName, lastName, email: String?
    let dateJoined: String?
    let isVisit: Bool?
    let gender: String?
    let img: String?
    
    enum CodingKeys: String, CodingKey {
        case lastLogin = "last_login"
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case dateJoined = "date_joined"
        case isVisit = "is_visit"
        case gender, img
    }
}
