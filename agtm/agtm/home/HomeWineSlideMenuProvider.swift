//
//  HomeEventSlideMenuProvider.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI

struct HomeWineSlideMenuProvider: View {
    var imageName : String
    var title : String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .cornerRadius(5)
                .frame(width: 170, height: 230)
            
            Text(title)
                .font(.title)
                .foregroundColor(Color.white)
                .bold()
                
        }
    }
}



struct HomeEventSlideMenuProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomeWineSlideMenuProvider(imageName: "testMenu", title: "String")
    }
}
