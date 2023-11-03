//
//  LikeWineCell.swift
//  agtm
//
//  Created by yujin on 2023/10/31.
//

import SwiftUI

struct LikeWineCell: View {
    @Binding var showTabBar: Bool
    var wine: Wine
    
    var body: some View {
        NavigationLink {
            WineDetailView(showTabBar: $showTabBar, wineLiked: wine.isLiked ?? false, wineID: wine.pk)
                .onAppear {
                    showTabBar = false
                }
        } label: {
            ZStack {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: wine.photos[0].file)) { image in
                        image
                            .resizable()
                            .cornerRadius(5)
                            .frame(width: 137, height: 184)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    HStack(spacing: 2) {
                        Image("star_full")
                            .resizable()
                            .frame(width: 10, height: 10)
                        
                        Image("star_full")
                            .resizable()
                            .frame(width: 10, height: 10)
                        
                        Image("star_full")
                            .resizable()
                            .frame(width: 10, height: 10)
                    }
                    .padding(.top, 10)
                    .padding(.leading, 6)
                    
                    
                    HStack(spacing: 22) {
                        Text(wine.name)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 80, alignment: .leading)
                            .padding(.leading, 6)
                        
                        Image(wine.isLiked ?? true  ? "heart_full" : "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    
                    
                    Text(wine.country?.name ?? "")
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(Color.gray400)
                        .bold()
                        .padding(.leading, 6)
                        .padding(.top, -10)
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width / 2 - 30 , height: 280)
            .background(Color.gray600)
            .cornerRadius(18)
        }
    }
}

//struct LikeWineCell_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeWineCell()
//    }
//}
