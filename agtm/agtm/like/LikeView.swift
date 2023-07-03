//
//  LikeView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct LikeView: View {
    var body: some View {
        
        VStack {
            LikeMenu()
            VStack {
                Text("즐겨찾기 목록")
                    .font(.system(size: 17))
                    .foregroundColor(Color.gray)
                    
                
            }
            
            
            ScrollView(showsIndicators: false) {
//                ClassMenuGrid()
//                HomeWineSlideMenu()
//                HomeSlideMenu()
//                    .padding(.leading , 15)
//                    .padding(.trailing , 15)
//                TabbarBank()
                
                ReviewView()
            }
        }
        
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
