//
//  WineLikeListCell.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import SwiftUI

struct WineLikeListCell: View {
//    var wine: Wine
    
    var body: some View {
        HStack {
            Button {
                // 디테일뷰
            } label: {
    //            Image("")
    //                .resizable()
    //                .padding(.horizontal, 8)
    //                .frame(width: 400, height: 250)
    //                .scaledToFit()
                RoundedRectangle(cornerRadius: 12)
                     .foregroundColor(.gray)
                     .frame(width: 150, height: 150)
                    
                     .padding(.trailing, 15)
                     .padding(.bottom, 10)
              
//                Spacer()
//                    .frame(width: )
                
                VStack(alignment: .leading) {
                    Text("menuName")
                        .font(.headline)
                        .foregroundColor(Color(uiColor: .black))
                        .frame(width: 180, alignment: .leading)
                    
                    Text("menuName")
                        .font(.body)
                        .foregroundColor(Color(uiColor: .black))
                        .frame(width: 180, alignment: .leading)
                }
            }
        }
    }
}

struct WineLikeListCell_Previews: PreviewProvider {
    static var previews: some View {
        WineLikeListCell()
    }
}

