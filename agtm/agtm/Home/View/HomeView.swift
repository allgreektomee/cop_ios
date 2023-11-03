//
//  HomeView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeView: View {
    @Binding var showTabBar: Bool
    @StateObject var homeViewModel =  HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//                NaviView(leftButton: ["logo"],rightButton: "search")
//                    .ignoresSafeArea()
//                    .onAppear {
//                        showTabBar = true
//                    }
                
                ScrollView(showsIndicators: false) {
                    VStack {
//                        HomeBanner(banners: homeViewModel.notices)
//                            .frame(alignment: .center)
                        
                        ListSlideTitle(title: "올그릭투미", subTitle: "좋아할만한 와인을 추천드릴게요!", image: "rib")
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 48)
                            .padding(.top, 52)

                        ListSlideMenu(showTabBar: $showTabBar, itemList: homeViewModel.wines)
                            .padding(.bottom, 20)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .frame(alignment: .center)

                        ListSlideTitle(title: "종류별 와인 모아보기", subTitle: "종류에 따라 맛과 특징이 다른 다른 와인을 살펴보세요!", image: "glass")
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 48)
                            .padding(.top, 35)

                        HomeMenuGrid(showTabBar: $showTabBar)

                        ListSlideTitle(title: "혜미님 Pick!", subTitle: "유저들이 추천한 와인 어때요?", image: "rib")
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 48)
                            .padding(.top, 52)

                        ListSlideMenu(showTabBar: $showTabBar, itemList: homeViewModel.pickWines)
                            .padding(.bottom, 20)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .frame(alignment: .center)

                        ListSlideTitle(title: "10월의 와인", subTitle: "쌀쌀한 가을에 먹기 좋은 와인을 뽑아봤어요.", image: "rib")
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.leading, 48)
                            .padding(.top, 52)

                        ListSlideMenu(showTabBar: $showTabBar, itemList: homeViewModel.monthlyWines)
                            .padding(.bottom, 130)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .frame(alignment: .center)

                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray800)
            }
            .ignoresSafeArea()
            .background(Color.gray800)
            .onAppear {
                homeViewModel.getNextWines()
                homeViewModel.getPickWines()
                homeViewModel.getMonthlyWines()
                homeViewModel.getNotice()
            }

        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
