//
//  PlaceType.swift
//  agtm
//
//  Created by yujin on 2023/06/23.
//

import Foundation

enum PlaceType: CaseIterable {
    case wine
    case food
    case cafe
    
    var name: String {
        switch self {
        case .wine: return "와인"
        case .food: return "식당"
        case .cafe: return "카페"
        }
    }
}
