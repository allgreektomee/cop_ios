//
//  TabBarContainerView.swift
//  agtm
//
//  Created by yujin on 2023/07/06.
//

import SwiftUI

struct TabBarContainerView<Content: View>: View {
    let content: Content
    @Binding var selection: TabBarItem
    @Binding var showTabBar: Bool
    @State private var tabs: [TabBarItem] = [.home, .like, .magazine, .user]
    
    init(selection: Binding<TabBarItem>, showTabBar: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
        self._showTabBar = showTabBar
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content.ignoresSafeArea()
            if showTabBar {
                TabBarView(tabs: tabs, localSelection: selection, selection: $selection)
            }
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct TabBarItemPreferenceKey: PreferenceKey {
    static var defaultValue = [TabBarItem]()
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
        // appending not change
    }
}

struct TabBarItemViewModifier: ViewModifier {
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}

//struct TabBarContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarContainerView()
//    }
//}
