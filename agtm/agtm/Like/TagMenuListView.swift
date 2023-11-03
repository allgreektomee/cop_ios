//
//  SwitchView.swift
//  agtm
//
//  Created by yujin on 2023/06/22.
//

import SwiftUI

struct TagMenuListView: View {
//    @Binding var showModal: Bool
    
    var body: some View {
        Spacer()
        
        List {
            ForEach(PlaceType.allCases, id: \.self) { place in
                TagMenuListCell()
                    .onTapGesture {
                        // detail 뷰로 이동
                    }
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)   
    }
}

