//
//  WineTypeList.swift
//  agtm
//
//  Created by yujin on 2023/10/16.
//

import SwiftUI

struct WineTypeList: View {
    @StateObject var homeViewModel =  HomeViewModel()
    @Binding var showTabBar: Bool
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var wineType: WineType?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(homeViewModel.winesTypeList, id: \.self) { wine in
                        LikeWineCell(showTabBar: $showTabBar, wine: wine)
                            .padding(.bottom, 20)
                    }
                }
                .padding(.trailing, 10)
                .padding(.leading, 10)
                .onAppear {
                    homeViewModel.getWineTypeList(type: self.wineType?.name ?? "")
                }
            }
            .background(Color.gray800)
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("back_arrow")
                .imageScale(.large)
        })
        .background(Color.gray800)
    }
}

//struct WineTypeList_Previews: PreviewProvider {
//    static var previews: some View {
//        WineTypeList()
//    }
//}
