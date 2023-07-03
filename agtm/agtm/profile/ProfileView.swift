//
//  ProfileView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct ProfileView: View {
    
    let columns = Array(repeating: GridItem(spacing: 5), count: 1)
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello,")
                        .font(.system(size: 25, weight: .medium))
                        .foregroundColor(.gray)
                    Text("AGTM")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.gray)

                }
                .padding(.leading, 30)
                Spacer()
                Image("testMenu")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.trailing, 30)

            }.padding(.top, 40)

            VStack {
                Text("리뷰 작성 목록")
                    .font(.system(size: 17))
                    .foregroundColor(Color.gray)


            }
            .padding(.top, 20)

            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(getClassMenuGrid()) { grid in
                        ClassMenuGridProvider(imageName: grid.imageName, menuName: grid.menuName )
                            .padding(.vertical, 5)

                    }

                }
                .frame(width: 350)
            }

        
        }
        .padding(.top, 20)


            
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
