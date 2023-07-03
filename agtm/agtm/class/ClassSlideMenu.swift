//
//  ClassSlideMenu.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import SwiftUI

struct ClassSlideMenu: View {
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            HStack {
                ForEach(getClassSlide()) { menu in
                    ClassSlideMenuProvider(imageName: menu.imageName, menuName: menu.menuName)
                }
                
            }
        }.padding(.top, 8)
        .padding(.bottom, 8)

    }
}

struct ClassSlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ClassSlideMenu()
    }
}
