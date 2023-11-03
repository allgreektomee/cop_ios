//
//  HomeBannerProvider.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeBannerProvider: View {
 
    var imageName : String
    var title : String
    var subTitle : String
    var w:Double
    var h:Double
    
    var body: some View {
        NavigationLink {
            WebView(url: "https://allgreektomee.com/0328cae0-97fc-41ba-bd53-3e52a7d39395")
        } label: {
            ZStack {
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: w, height: h)
                
                Image("bannertext")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: w, height: h)
            }
//            AsyncImage(url: URL(string: imageName)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: w, height: h)
//            } placeholder: {
//                ProgressView()
//            }

//                .resizable()
//                .frame(width: w, height: h)
//                .aspectRatio(contentMode: .fill)
//                .overlay {
//                    VStack {
//                        Text(title)
//                            .font(.system(size: 20, weight: .regular))
//                            .foregroundColor(.black)
//                            .multilineTextAlignment(.leading)
//                            .frame(width: 300, alignment: .center)
//                            .padding(.top , -10)
//
//
//                        Text(subTitle)
//                            .font(.system(size: 16, weight: .light))
//                            .foregroundColor(.black)
//                            .frame(width: 300, alignment: .center)
//
//                    }
//                }
        }
    }
}

struct HomeBannerProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomeBannerProvider(imageName: "bg",
                           title: "title String title String title ",
                           subTitle: "subTitle String",
                           w:400,
                           h: 300)
    }
}
