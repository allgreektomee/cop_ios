//
//  TabBarItem.swift
//  agtm
//
//  Created by yujin on 2023/07/05.
//

import Foundation

enum TabBarItem: Hashable {
    case home, like, magazine, user
    
    var iconName: String {
        switch self {
        case .home: return "home"
        case .like: return "like"
        case .magazine: return "magazine"
        case .user: return "user"
        }
    }
}
