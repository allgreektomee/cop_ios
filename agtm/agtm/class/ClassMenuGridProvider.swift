//
//  ClassMenuGridProvider.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import SwiftUI

struct ClassMenuGridProvider: View {
    var imageName : String
    var menuName : String
    
    var body: some View {
        Button {
            //
        } label: {
            ZStack {
                Image(imageName)
                    .resizable()
                    .padding(.horizontal, 8)
                    .frame(width: 400, height: 250)
                    .scaledToFit()
                
                Text(menuName)
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .white))
                    
            }
           
        }
    }
}

struct ClassMenuGridProvider_Previews: PreviewProvider {
    static var previews: some View {
        ClassMenuGridProvider(imageName: "testMenu", menuName: "adf")
    }
}
