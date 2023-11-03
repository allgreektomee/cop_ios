//
//  LikeView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct LikeView: View {
    @StateObject var likeViewModel = LikeViewModel()
    @Binding var showTabBar: Bool
    @State var selectWishOrder = false // true 면 wish , false 면 like
    @State var selectWineClass = false // true 면 wine , false 면 class
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    ListSlideTitle(title: "관심있는 모든 와인 ", subTitle: "나의 위시리스트와 주문 내역을 확인할 수 있어요.", image: "rib")
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(.leading, 48)
                        .padding(.top, 80)
                        .onAppear {
                            showTabBar = true
                        }
                    
                    WishOrderMenu(isSelectSegment: $selectWishOrder,
                                  selectWineClass: $selectWineClass,
                                  likeViewModel: likeViewModel)
                        .padding(.top, 36)
                        .padding(.leading, 20)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                    LikeMenu(isSelectSegment: $selectWineClass,
                             selectWishMenu: $selectWishOrder,
                             likeViewModel: likeViewModel)
                        .padding(.top, 2)
                        .padding(.leading, 24)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                    //wine
                    WineLikeListView(showTabBar: $showTabBar, wineLikeList: likeViewModel.likeWineList, classLikeList: likeViewModel.likeClassList)
                        .padding(.bottom, 20)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .padding(.top, 41)
                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                        .opacity(selectWineClass ? 0 : 1)
                        .frame(height: selectWineClass ? 0 : nil)
                    
                    
                    // class
                    VStack {
                        ForEach(likeViewModel.likeClassList, id: \.self) { wineClass in
                            ClassLikeListCell(showTabBar: $showTabBar, wineClass: wineClass)
                                .padding(.bottom, 10)
                        }
                    }
                    .opacity(selectWineClass ? 1 : 0)
                    .frame(height: selectWineClass ? nil : 0)
                    .padding(.bottom, 120)
                    
                    
                }
                .onAppear {
                    likeViewModel.getLikeWineList()
                }
                
            }
            .background(Color.gray800)
        }
        
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView(showTabBar: .constant(true))
    }
}
