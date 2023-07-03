//
//  HomeWineTypeGridProvider.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct HomeWineTypeGridProvider: View {
    var imageName : String
    var menuName : String
    
    var body: some View {
        NavigationLink {
            WineDetailView()
        } label: {
            VStack {
                Image(imageName)
                    .resizable()
                    .padding(.horizontal, 8)
                    .frame(width: 200, height: 300)
                    .scaledToFit()
                
                Text("미국")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 8)
                    .foregroundColor(Color(uiColor: .gray))
                    .frame(width:200, height:.infinity, alignment: .leading)
                
                Text(menuName)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 8)
                    .foregroundColor(Color(uiColor: .white))
                    .frame(width:200, height:.infinity, alignment: .leading)
            }
           
        }
    }
}

struct HomeWineTypeGridProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomeWineTypeGridProvider(imageName: "testMenu", menuName: "asdf asdfsdf ")
    }
}
