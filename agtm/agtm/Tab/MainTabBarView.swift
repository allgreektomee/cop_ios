//
//  MainTabBarView.swift
//  agtm
//
//  Created by yujin on 2023/07/06.
//

import SwiftUI

struct MainTabBarView: View {
    @State private var tabSelection: TabBarItem = .home
    @Binding var showTabBar: Bool
    
    var body: some View {
        TabBarContainerView(selection: $tabSelection, showTabBar: $showTabBar) {
            HomeView(showTabBar: $showTabBar)
                .tabBarItem(tab: .home, selection: $tabSelection)
            ClassView(showTabBar: $showTabBar)
                .tabBarItem(tab: .like, selection: $tabSelection)
            LikeView(showTabBar: $showTabBar)
                .tabBarItem(tab: .magazine, selection: $tabSelection)
            ProfileView(showTabBar: $showTabBar)
                .tabBarItem(tab: .user, selection: $tabSelection)
        }
        
    }
}
//
//struct MainTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBarView()
//    }
//}
