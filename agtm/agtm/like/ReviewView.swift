//
//  ReviewView.swift
//  agtm
//
//  Created by yujin on 2023/06/28.
//

import SwiftUI

struct ReviewView: View {
    @State var collapsed: Bool = true
    @State private var showModal = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 40, height: 40)
                Text("leeyujin")
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.leading, 15)
            .padding(.bottom, 10)
            
            ZStack(alignment: .trailing) {
                HomeBanner(bannerWidth: 400, bannerCornerRadius: 14)
                    .padding(.leading , 15)
                    .padding(.trailing , 15)
                    .padding(.bottom)
                
                Button {
                    self.showModal = true
                } label: {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 30)
                .padding(.top, 300)
                .sheet(isPresented: self.$showModal) {
                    TagMenuView()
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }

            }
            
//            // 좋아요, 스크랩
//            LikeScrapButtonView()
//                .padding(.leading , 15)
//                .padding(.trailing , 15)
//                .padding(.bottom)
//
            TestView()
                .padding(.leading, 17)
                .padding(.trailing, 17)
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
