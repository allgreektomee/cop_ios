//
//  HomeView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeView: View {
    @State private var currentPlace = PlaceType.wine
    
    var body: some View {
        NavigationView {
            VStack {
                
                HomeNaviView(currentPlace: $currentPlace)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
//                        Text(currentPlace.name)
                        
                        HomeBanner(bannerWidth: 300)
                        
                        ZStack(alignment: .leading) {
                            RoundView()
                                .frame(height: 90)
                                .padding(.top, -35)
                            
                            HomeWineSlideTitle(title: "올그릭투미", subTitle: "좋아할만한 와인을 추천드려요.")
                                .padding(.leading, 15)
                                .padding(.trailing, 15)
                        }

                        HomeWineSlideMenu()
                            .padding(.bottom, 20)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .padding(.bottom, 30)
                        
                        
                        HomeWineSlideTitle(title: "종류별 와인 모아보기", subTitle: "종류에 따라 맛과 특징이 다른 와인을 살펴보세요.")
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                        
                        HomeSlideMenu()
                            .padding(.bottom, 25)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                        
//                        HomeSlideMenu()
//                            .padding(.bottom, 25)
//                            .padding(.leading, 15)
//                            .padding(.trailing, 15)
                        
                        HomeWineSlideTitle(title: "혜미님 추천 와인", subTitle: "와인 추천 목록")
                            .padding(.leading, 15)
                            .padding(.trailing, 15)

                        HomeWineSlideMenu()
                            .padding(.bottom, 20)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
//
//                        HomeWineSlideTitle(title: "올그릭투미!! ", subTitle: "와인 추천 목록 와인 추천 목록")
//                            .padding(.leading, 15)
//                            .padding(.trailing, 15)
//
//                        HomeWineSlideMenu()
//                            .padding(.bottom, 20)
//                            .padding(.leading, 15)
//                            .padding(.trailing, 15)
//
//
                        HomeWineSlideTitle(title: "6월 와인", subTitle: "와인 추천 목록 와인 추천 목록")
                            .padding(.leading, 15)
                            .padding(.trailing, 15)

                        HomeWineSlideMenu()
                            .padding(.bottom, 20)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)

                        HomeWineSlideTitle(title: "국가별 추천 와인", subTitle: "대표 와인들 소개 합니다.")
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                        
                    }
                    VStack(alignment: .center){
                        HomeMenuGrid()
                        TabbarBank()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color(uiColor: .systemGray6))
                .background(.white)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
