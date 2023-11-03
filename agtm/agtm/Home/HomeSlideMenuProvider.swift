//
//  HomeSlideMenuProvider.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI

struct HomeSlideMenuProvider: View {
    var imageName : String
    var menuName : String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(5)
            Text(menuName)
                .font(.subheadline)
        }
    }
}


struct HomeSlideMenuProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomeSlideMenuProvider(imageName: "testMenu", menuName: "String")
    }
}
