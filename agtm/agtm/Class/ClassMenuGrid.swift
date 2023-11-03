//
//  ClassMenuGrid.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import SwiftUI

struct ClassMenuGrid: View {
    let columns = Array(repeating: GridItem(spacing: 5), count: 1)
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(getClassMenuGrid()) { grid in
                    ClassMenuGridProvider(imageName: grid.imageName, menuName: grid.menuName )
                        .padding(.vertical, 5)
                        
                       
                        
                }
                
            }
            .frame(width: 400)
           
        }
    }
}

struct ClassMenuGrid_Previews: PreviewProvider {
    static var previews: some View {
        ClassMenuGrid()
    }
}
