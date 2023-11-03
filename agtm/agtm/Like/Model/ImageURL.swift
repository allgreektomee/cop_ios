//
//  ImageURL.swift
//  agtm
//
//  Created by yujin on 2023/07/14.
//

import Foundation

// MARK: - ImageURL
struct ImageURL: Codable {
    let result: ImageURLResult
    let success: Bool
    let errors, messages: [String]
}

// MARK: - Result
struct ImageURLResult: Codable {
    let id: String
    let uploadURL: String
}

