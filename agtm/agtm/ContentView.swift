//
//  ContentView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI

struct ContentView: View {
//    @State private var selection: Tab = .home
    @State private var showTabBar = true
    
    enum Tab {
        case home
        case heart
        case dumbbell
        case camera
    }
    
    var body: some View {
        Color.gray800
            .ignoresSafeArea()
            .overlay {
                MainTabBarView(showTabBar: $showTabBar)
            }
    }
}

//미리보기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
