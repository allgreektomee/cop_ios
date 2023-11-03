//
//  HomeMenuGrid.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

enum WineType: String, CaseIterable {
    case red = "red"
    case white = "white"
    case natural = "natural"
    case rose = "rose"
    case sweet = "sweet"
    case sparkling = "sparkling"
    
    var name: String {
        return "\(self.rawValue)"
    }
}

struct HomeMenuGrid: View {
    @Binding var showTabBar: Bool
    let columns = Array(repeating: GridItem(spacing: 10), count: 3)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(WineType.allCases, id: \.self) { type in
                    HomeMenuGridProvider(showTabBar: $showTabBar, imageName: "testMenu", type: type)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                }
                
            }
            .frame(width: 340)
           
        }
    }
}
