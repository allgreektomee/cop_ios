//
//  ClassLikeListCell.swift
//  agtm
//
//  Created by yujin on 2023/10/24.
//

import SwiftUI

struct ClassLikeListCell: View {
    @Binding var showTabBar: Bool
    var wineClass: ClassLike
    
    var body: some View {
        NavigationLink{
            ClassDetailView(showTabBar: $showTabBar, classLiked: true , classID: wineClass.agtmclass.pk)
                .onAppear {
                    showTabBar = false
                }
        } label: {
            HStack {
                AsyncImage(url: URL(string: wineClass.agtmclass.photos[0].file)) { image in
                    image
                        .resizable()
                        .frame(width: 110, height: 110)
                        .padding(.trailing, 15)
                        .padding(.bottom, 10)
                        .cornerRadius(12, corners: .allCorners)
                } placeholder: {
                    ProgressView()
                }
                
                VStack {
                    Text(wineClass.agtmclass.title)
                        .font(.system(size: 19, weight: .medium))
                        .foregroundColor(Color(uiColor: .white))
                        .frame(width: 180, alignment: .leading)
                    
                    Text(wineClass.agtmclass.subtitle)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color(uiColor: .white))
                        .frame(width: 180, alignment: .leading)
                        .padding(.bottom, 10)
                    
//                    Text(wineClass.agtmclass)
//                        .font(.system(size: 14, weight: .light))
//                        .foregroundColor(Color(uiColor: .white))
//                        .frame(width: 180, alignment: .trailing)
//
//                    Text("\(wineClass.start) ~ \(wineClass.end) \(wineClass.price)원")
//                        .font(.system(size: 14, weight: .light))
//                        .foregroundColor(Color(uiColor: .white))
//                        .frame(width: 180, alignment: .trailing)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 150)
            .background(Color.gray600)
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

//struct ClassListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassListCell()
//    }
//}
