//
//  Common.swift
//  agtm
//
//  Created by yujin on 2023/10/26.
//

import Foundation

import Combine

class Common: ObservableObject {

    // Singleton
    static let shared = Common()
    private init() {}

    @Published var loginInfo: Profile?
    @Published var loginID: String?
}
                                                                                                                                   
