//
//  ClassSlideMenuProvider.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import SwiftUI

struct ClassSlideMenuProvider: View {
    var imageName : String
    var menuName : String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 40)
                .cornerRadius(5)
            Text(menuName)
                .font(.subheadline)
                .foregroundColor(Color.white)
        
        }
    }
}

struct ClassSlideMenuProvider_Previews: PreviewProvider {
    static var previews: some View {
        ClassSlideMenuProvider(imageName: "testMenu", menuName: "인기글")
    }
}
