//
//  WishOrderMenu.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import SwiftUI

struct WishOrderMenu: View {
    @Binding var isSelectSegment: Bool
    @Binding var selectWineClass: Bool
    var likeViewModel: LikeViewModel?
    
    var body: some View {
        HStack {
            Button(action: {
                if isSelectSegment {
                    isSelectSegment.toggle()
                }
                if selectWineClass {
                    likeViewModel?.getLikeClassList()
                } else {
                    likeViewModel?.getLikeWineList()
                }
            }) {
                Text("WISH")
                    .foregroundColor(isSelectSegment ? .gray400 : .white)
                    .font(.system(size: 18, weight: isSelectSegment ? .regular : .semibold))
            }
            .frame(width: 60, height: 32)
            .cornerRadius(80)
            
            //TODO:- Business Button
            Button(action: {
                if !isSelectSegment {
                    isSelectSegment.toggle()
                }
                
                if selectWineClass {
                    likeViewModel?.getOrderClassList()
                } else {
                    likeViewModel?.getOrderWineList()
                }
                
            }) {
                Text("ORDER")
                    .foregroundColor(isSelectSegment ? .white : .gray400)
                    .font(.system(size: 18, weight: isSelectSegment ? .semibold : .regular))
            }
            .frame(width: 64, height: 32)
            .cornerRadius(80)
        }
    }
}
//
//struct WishOrderMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        WishOrderMenu(isSelectSegment: .constant(false))
//    }
//}
