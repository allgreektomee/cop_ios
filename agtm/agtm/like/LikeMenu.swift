//
//  LikeMenu.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct LikeMenu: View {
    @State var isSelectSegment = false
    
    var body: some View {
        HStack {
            
            //TODO:- Personal Button
            Button(action: {
                if isSelectSegment {
                    isSelectSegment.toggle()
                }
                
            }) {
                Text("Wine")
                    .foregroundColor(isSelectSegment ? .black : .white)
                    .font(.system(size: 19))
            }
            .frame(width: 190, height: 54)
            .background(isSelectSegment ? .white : .yellow)
            .cornerRadius(14)
            
            //TODO:- Business Button
            Button(action: {
                if !isSelectSegment {
                    isSelectSegment.toggle()
                }
            }) {
                Text("Class")
                    .foregroundColor(isSelectSegment ? .white : .black)
                    .font(.system(size: 19))
            }
            .frame(width: 190, height: 54)
            .background(isSelectSegment ? .yellow : .white)
            .cornerRadius(14)
        }
        .padding(.top, 30)
    }
}

struct LikeMenu_Previews: PreviewProvider {
    static var previews: some View {
        LikeMenu()
    }
}
