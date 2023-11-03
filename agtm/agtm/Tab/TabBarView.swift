//
//  TabBarView.swift
//  agtm
//
//  Created by yujin on 2023/07/06.
//

import SwiftUI

struct TabBarView: View {
    let tabs: [TabBarItem]
    @State var localSelection: TabBarItem
    @Binding var selection: TabBarItem
    
    var body: some View {
        tabBarView
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

private extension TabBarView {
    func tableView(tab: TabBarItem) -> some View {
        Image(localSelection == tab ? tab.iconName + "_selected" : tab.iconName)
            .font(.subheadline)
            .padding(.vertical, 8)
            .frame(width: 75)
            .frame(height: 64)
    }
    
    func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
    func switchToTabWithAnimation(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
    
    var tabBarView: some View {
        HStack {
            ForEach(tabs, id:\.self) { tab in
                tableView(tab: tab)
                    .onTapGesture {
                        // 애니메이션이 적용된 tab 전환
                        switchToTabWithAnimation(tab: tab)
                        // 기본 tab 전환
//                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(
            Color.gray500.ignoresSafeArea(edges: .bottom)
        )
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
