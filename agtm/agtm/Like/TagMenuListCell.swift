//
//  SwitchViewCell.swift
//  agtm
//
//  Created by yujin on 2023/06/22.
//

import SwiftUI

struct TagMenuListCell: View {
//    var placeName = ""
//    @Binding var currentPlace: PlaceType
    
    var body: some View {
        HStack {
            Button {
                // 장소 변경
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

struct TagMenuListCell_Previews: PreviewProvider {
    static var previews: some View {
        TagMenuListCell()
    }
}
