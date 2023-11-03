//
//  BottomView.swift
//  agtm
//
//  Created by yujin on 2023/10/20.
//

import SwiftUI

struct BottomView: View {
    @Binding var likeAction: Bool
    @Binding var messageAction: Bool
    
    var wineLiked = false
    
    var body: some View {
        HStack(spacing: 30) {
            HStack {
                Button {
                    likeAction.toggle()

                    
                } label: {
                    Image(wineLiked ? "heart_full" : "heart")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .frame(alignment: .leading)
                }

                
                Button {
                    // 리뷰 이동
                } label: {
                    Image("message")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .frame(alignment: .leading)
                }
            }
            
            RoundedRectangle(cornerRadius: 20)
                .overlay {
                    Text("주문하기")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.mainYellow)
                }
                .frame(width: 206, height: 60, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(
            Color.gray800.ignoresSafeArea(edges: .bottom)
        )
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .frame(alignment: .bottom)
    }
}

//struct BottomView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomView()
//    }
//}
