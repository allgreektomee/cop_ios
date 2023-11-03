//
//  ClassListView.swift
//  agtm
//
//  Created by yujin on 2023/06/27.
//

import SwiftUI

struct ClassListView: View {
    let columns = Array(repeating: GridItem(spacing: 5), count: 1)
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(getClassMenuGrid()) { grid in
//                    ClassMenuGridProvider(imageName: grid.imageName, menuName: grid.menuName )
//                        .padding(.vertical, 5)
                        
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 120, height: 120)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading) {
                            Text("올그릭스토리")
                                .font(.system(size: 12))
                            
                            Text(grid.imageName)
                        }
                        .frame(width: 210, alignment: .leading)
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
           
        }
    }
}

struct ClassListView_Previews: PreviewProvider {
    static var previews: some View {
        ClassListView()
    }
}
