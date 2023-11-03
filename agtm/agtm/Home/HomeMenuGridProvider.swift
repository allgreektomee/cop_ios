//
//  HomeMenuGrid.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeMenuGridProvider: View {
    @Binding var showTabBar: Bool
    var imageName : String
    var type: WineType
    
    var body: some View {
        NavigationLink {
            WineTypeList(showTabBar: $showTabBar, wineType: type)
        }label: {
            VStack {
                Text(type.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(uiColor: .white))
                    
            }
            .frame(width: 110, height: 115)
            .background(Color.gray600)
            .cornerRadius(14)
           
        }
    }
}
