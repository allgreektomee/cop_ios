//
//  LikeMenu.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct LikeMenu: View {
    @Binding var isSelectSegment: Bool
    @Binding var selectWishMenu: Bool
    var likeViewModel: LikeViewModel?
    
    var body: some View {
        HStack {
            Button(action: {
                if isSelectSegment {
                    isSelectSegment.toggle()
                }
                
                if selectWishMenu {
                    likeViewModel?.getOrderWineList()
                } else {
                    likeViewModel?.getLikeWineList()
                }
                
            }) {
                Text("와인")
                    .foregroundColor(isSelectSegment ? .gray100 : .gray800)
                    .font(.system(size: 14, weight: isSelectSegment ? .regular : .semibold))
            }
            .frame(width: 56, height: 32)
            .background(isSelectSegment ? Color.gray600 : .white)
            .cornerRadius(80)
            
            Button(action: {
                if !isSelectSegment {
                    isSelectSegment.toggle()
                }
                
                if selectWishMenu {
                    likeViewModel?.getOrderClassList()
                } else {
                    likeViewModel?.getLikeClassList()
                }
                
            }) {
                Text("클래스")
                    .foregroundColor(isSelectSegment ? .gray800 : .gray100)
                    .font(.system(size: 14, weight: isSelectSegment ? .semibold : .regular))
            }
            .frame(width: 56, height: 32)
            .background(isSelectSegment ? .white : Color.gray600)
            .cornerRadius(80)
        }
    }
}

//struct LikeMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeMenu(isSelectSegment: .constant(false))
//    }
//}
