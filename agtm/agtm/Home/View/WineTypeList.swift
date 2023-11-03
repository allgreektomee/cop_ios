//
//  WineTypeList.swift
//  agtm
//
//  Created by yujin on 2023/10/16.
//

import SwiftUI

struct WineTypeList: View {
    @StateObject var homeViewModel =  HomeViewModel()
    @Binding var showTabBar: Bool
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var wineType: WineType?    
    
    var body: some View {
        VStack {
            NaviView(leftButton: ["back_arrow", "back_home"] ,title: "",rightButton: "search")
                .ignoresSafeArea()
                .onAppear {
                    showTabBar = false
                }
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(homeViewModel.winesTypeList, id: \.self) { wine in
                        LikeWineCell(showTabBar: $showTabBar, wine: wine)
                            .padding(.bottom, 20)
                    }
                }
                .padding(.trailing, 10)
                .padding(.leading, 10)
                .onAppear {
                    homeViewModel.getWineTypeList(type: self.wineType?.name ?? "")
                }
            }
            .background(Color.gray800)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .background(Color.gray800)
    }
}

//struct WineTypeList_Previews: PreviewProvider {
//    static var previews: some View {
//        WineTypeList()
//    }
//}
