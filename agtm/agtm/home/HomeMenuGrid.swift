//
//  HomeMenuGrid.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeMenuGrid: View {
    let columns = Array(repeating: GridItem(spacing: 5), count: 3)
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 0) {
            
                    ForEach(getMenuGrid()) { grid in
                        HomeMenuGridProvider(imageName: grid.imageName, menuName: grid.title )
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                    }
                
            }
            .frame(width: 340)
           
        }
    }
}

struct HomeMenuGrid_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuGrid()
    }
}
