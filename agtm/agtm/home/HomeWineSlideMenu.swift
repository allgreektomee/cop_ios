//
//  HomeEventSlideMenu.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI

struct HomeWineSlideMenu: View {
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            HStack {
                NavigationLink {
                    WineDetailView()
                }label: {
                    ForEach(getWineSlideMenu()) { event in
                        HomeWineSlideMenuProvider(imageName: event.imageName, title: event.title )
                    }
                }
                
                
            }
        }.padding(.top, 8)
        .padding(.bottom, 8)

    }
}

struct HomeEventSlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeWineSlideMenu()
    }
}
