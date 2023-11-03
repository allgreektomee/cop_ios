//
//  imageUpload.swift
//  agtm
//
//  Created by yujin on 2023/07/14.
//

import Foundation

// MARK: - ImageUpload
struct ImageUpload: Codable {
    let result: ImageResult
    let success: Bool
    let errors, messages: [String]
}

// MARK: - ImageResult
struct ImageResult: Codable {
    let id, filename, uploaded: String
    let requireSignedURLs: Bool
    let variants: [String]
}
