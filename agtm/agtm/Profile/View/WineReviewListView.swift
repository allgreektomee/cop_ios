//
//  WineReviewListView.swift
//  agtm
//
//  Created by yujin on 2023/10/27.
//

import SwiftUI

struct WineReviewListView: View {
    @Binding var showTabBar: Bool
    var reviewList: ReviewList = []
    
    var body: some View {
        VStack {
            NaviView(leftButton: ["back_arrow", "back_home"],title: "상세",rightButton: "search")
                .ignoresSafeArea()
         
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(reviewList, id: \.self) { review in
                        ReviewCell(review: review)
                        
                        Divider()
                    }
                }
            }
        }
        .onAppear {
            showTabBar = false
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.gray800)
    }
}
