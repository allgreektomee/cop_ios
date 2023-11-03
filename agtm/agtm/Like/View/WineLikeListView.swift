//
//  WineLikeListView.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import SwiftUI

struct WineLikeListView: View {
    @Binding var showTabBar: Bool
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var wineLikeList: WineLikeList = []
    var classLikeList: ClassLikeList = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(wineLikeList, id: \.self) { wine in
                    LikeWineCell(showTabBar: $showTabBar, wine: wine.wine!)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

//struct WineLikeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WineLikeListView(      )
//    }
//}
