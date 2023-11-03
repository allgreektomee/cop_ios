//
//  HomeNaviView.swift
//  agtm
//
//  Created by yujin on 2023/06/22.
//

import SwiftUI

struct HomeNaviView: View {
//    @State private var showModal = false
    @Binding var currentPlace: PlaceType
    
    var body: some View {
        HStack(spacing: 230) {
            Button {
                //action
            } label: {
                Image("")
            }
            .frame(width: 80, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
            
            Button {
                // switch
//                self.showModal = true
            } label: {
                Image(systemName: "")
                    .resizable()
            }
            .frame(width: 40, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
//            .sheet(isPresented: self.$showModal) {
//                SwitchView(currentPlace: $currentPlace, showModal: $showModal)
//                    .presentationDetents([.medium])
//                    .presentationDragIndicator(.visible)
//            }
        }
    }
}
