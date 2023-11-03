//
//  ClassListCell.swift
//  agtm
//
//  Created by yujin on 2023/10/11.
//

import SwiftUI

struct ClassListCell: View {
    @Binding var showTabBar: Bool
    var wineClass: Class
    
    var body: some View {
        NavigationLink{
            ClassDetailView(showTabBar: $showTabBar, classLiked: wineClass.isLiked , classID: wineClass.pk)
                .onAppear {
                    showTabBar = false
                }
        } label: {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: wineClass.photos[0].file)) { image in
                    image
                        .resizable()
                        .frame(width: 110, height: 110)
                        .cornerRadius(12, corners: .allCorners)
                } placeholder: {
                    ProgressView()
                }
                
                VStack {
                    Text(wineClass.title)
                        .font(.system(size: 19, weight: .medium))
                        .foregroundColor(Color(uiColor: .white))
                        .frame(width: 220, alignment: .leading)
                    
                    Text(wineClass.subtitle)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color(uiColor: .white))
                        .frame(width: 220, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    Text(wineClass.place)
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(uiColor: .white))
                        .frame(width: 180, alignment: .trailing)
                    
                    Text("\(wineClass.start) ~ \(wineClass.end) \(wineClass.price)원")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color(uiColor: .white))
                        .frame(width: 180, alignment: .trailing)
                }
            }
            .padding(.leading, 10)
            .frame(width: UIScreen.main.bounds.width - 30, height: 150)
            .background(Color.gray600)
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

struct ClassListCell_Previews: PreviewProvider {
    static var previews: some View {
        ClassListCell(showTabBar: .constant(false),
                      wineClass: Class(pk: 1, title: "프랑스 와인 시음회", subtitle: "8월 주말 5종류 프랑스 와인 시음", place: "올그릭투미", address: "신촌 서대문구 명물길34 1,2,3층", price: 40000, start: "17:00", end: "21:00", owner: Owner(img: "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg", username: "allgreektome", email: ""), photos: [Photo(pk: 34, file: "https://imagedelivery.net/H4jrBT7_U0Ji_5U964zJAw/617bb774-7b4d-4f8a-5aae-d4594c973400/public", description: "class2")], isLiked: false)
                      )
    }
}
