//
//  HomeWineTypeGrid.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

//import SwiftUI
//
//struct HomeWineTypeGrid: View {
//    let columns = Array(repeating: GridItem(spacing: 5), count: 2)
//    var body: some View {
//
//        ScrollView(showsIndicators: false) {
//            VStack {
//                LazyVGrid(columns: columns, spacing: 0) {
//                    ForEach(getWineTypeGrid()) { grid in
//                        HomeWineTypeGridProvider(imageName: grid.imageName, menuName: grid.menuName )
//                            .padding(.vertical, 5)
//                        
//                    }.padding(.top, 20)
//                    
//                }
//                .frame(width: 380)
//            }
//                
//      
//            
//            TabbarBank()
//        }
//    }
//}
//
//
