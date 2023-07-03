//
//  HomeBanner.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeBanner: View {
    var bannerWidth: CGFloat?
    var bannerCornerRadius = 0.0
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            TabView {
                ForEach(getBanner()) { banner in
                    HomeBannerProvider(imageName: banner.imageName, title: banner.title, subTitle: banner.subTitle ,w: w, h: h)
                        .cornerRadius(bannerCornerRadius)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .overlay(Fancy3DotsIndexView(numberOfPages: getBanner().count, currentIndex: 1))
        }
        .frame(width: .infinity, height: bannerWidth)
    }
}

struct HomeBanner_Previews: PreviewProvider {
    static var previews: some View {
        HomeBanner(bannerWidth: 300)
    }
}
