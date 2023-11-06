//
//  ListSlideMenu.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI

struct ListSlideMenu: View {
    @Binding var showTabBar: Bool
    var itemList: wineList = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            HStack {
                ForEach(itemList, id: \.self) { wine in
                    ListSlideMenuProvider(showTabBar: $showTabBar, wine: wine)
                }
                .padding(.trailing, 10)
            }
            .padding(.leading, 24)
        }.padding(.top, 8)
            .padding(.bottom, 8)
            
    }
}

