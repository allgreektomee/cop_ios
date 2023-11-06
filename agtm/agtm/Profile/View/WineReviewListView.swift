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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
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
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("back_arrow")
                .imageScale(.large)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.gray800)
    }
}
