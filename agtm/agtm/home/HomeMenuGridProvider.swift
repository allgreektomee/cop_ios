//
//  HomeMenuGrid.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeMenuGridProvider: View {
    var imageName : String
    var menuName : String
    
    var body: some View {
        NavigationLink {
            HomeWineTypeGrid()
        }label: {
            
            ZStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                
                Text(menuName)
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .white))
                    
            }
           
        }
    }
}

struct HomeMenuGridProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuGridProvider(imageName: "testMenu", menuName: "menu")
    }
}
