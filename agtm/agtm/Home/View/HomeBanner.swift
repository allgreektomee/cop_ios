//
//  HomeBanner.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeBanner: View {
    @State private var currentIndex = 0
    var bannerWidth = UIScreen.main.bounds.width - 48.0
    var bannerHeight = 88.0
    var bannerCornerRadius = 12.0
    var banners: NoticeList = []
    var visiblePageControl = true
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            TabView(selection: $currentIndex) {
                ForEach(0..<1, id: \.self) { index in
                    ZStack(alignment: .bottomTrailing) {
                        HomeBannerProvider(imageName: "banner"
                                            //banners[index].photos[0].file
                                           , title: "", subTitle: "" ,w: w, h: h)
                            .cornerRadius(bannerCornerRadius)
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
//                        if visiblePageControl {
//                            Text("\(index + 1) / \(getBanner().count)")
//                                .font(.caption)
//                                .padding(5)
//                                .foregroundColor(.white)
//                                .background(.black.opacity(0.5))
//                                .cornerRadius(50)
//                                .padding(.trailing, 15)
//                                .padding(.bottom, 50)
//                        }
                    }
                    
                }
            }
            .tabViewStyle(.page)
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: (visiblePageControl) ? .never : .always))
//            .overlay(Fancy3DotsIndexView(numberOfPages: getBanner().count, currentIndex: 1))
        }
        .frame(width: bannerWidth, height: bannerHeight)
    }
}

struct HomeBanner_Previews: PreviewProvider {
    static var previews: some View {
        HomeBanner()
    }
}

