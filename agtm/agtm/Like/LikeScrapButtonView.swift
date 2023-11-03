//
//  LikeScrapButtonView.swift
//  agtm
//
//  Created by yujin on 2023/06/28.
//

import SwiftUI

struct LikeScrapButtonView: View {
    var body: some View {
        HStack {
            Button {
                // 좋아요
            } label: {
                Image(systemName: "heart")
                    
            }
            
            Button {
                // 스크랩
            } label: {
                Image(systemName: "bookmark")
            }
            
            Spacer()
                .frame(width: UIScreen.main.bounds.size.width - 130)
            
            Button {
                //
            } label: {
                Image(systemName: "bookmark")
            }
            
            Button {
                //
            } label: {
                Image(systemName: "square.and.arrow.up")
            }

        }
    }
}

struct LikeScrapButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LikeScrapButtonView()
    }
}
