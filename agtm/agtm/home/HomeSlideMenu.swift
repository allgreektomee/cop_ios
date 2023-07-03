//
//  HomeSlideMenu.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI

struct HomeSlideMenu: View {
    var body: some View {
        
        ScrollView([.horizontal], showsIndicators: false) {
            HStack {
                ForEach(getSlideMenu()) { menu in
                    NavigationLink {
                        HomeWineTypeGrid()
                    }label: {
                        HomeSlideMenuProvider(imageName: menu.imageName, menuName: menu.menuName)
                    }
                }
                
            }
        }.padding(.top, 8)
        .padding(.bottom, 8)

    }
}

struct HomeSlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeSlideMenu()
    }
}
