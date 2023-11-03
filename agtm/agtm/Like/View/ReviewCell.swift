//
//  ReviewCell.swift
//  agtm
//
//  Created by yujin on 2023/10/24.
//

import SwiftUI

struct ReviewCell: View {
    var review: Review?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: review?.user.img ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: 55, height: 55)
                        .cornerRadius(6, corners: .allCorners)
                        .padding(.leading, 20)
                } placeholder: {
                    ProgressView()
                }
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(review?.user.username ?? "")
                            .padding(.trailing, 5)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                        
                        ForEach(0..<5) { _ in
                            Image("star_full")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .padding(.leading, -5)
                        }
                    }
                    Text(review?.comment ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    
                    Text(review?.createAt ?? "")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ReviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCell()
    }
}
