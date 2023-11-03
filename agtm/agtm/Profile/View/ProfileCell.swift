//
//  ProfileCell.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import SwiftUI

struct ProfileCell: View {
    var title: String = "프로필 정보"
    var cellHeight: Double = 120.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .foregroundColor(Color.gray600)
            .frame(width: UIScreen.main.bounds.width - 40, height: cellHeight)
            .overlay {
                VStack {
                    Text(title)
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.gray400)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.bottom, cellHeight - 50)
                }
            }
    }
}

struct ProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCell()
    }
}
