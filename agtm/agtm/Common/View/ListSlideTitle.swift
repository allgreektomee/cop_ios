//
//  ListSlideTitle.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct ListSlideTitle: View {
    var title : String
    var subTitle : String
    var image: String
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .scaledToFit()
                
                Text(title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
            }
            Text(subTitle)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.gray400)
                       
        }
    }
}

struct ListSlideTitle_Previews: PreviewProvider {
    static var previews: some View {
        ListSlideTitle(title: "Title Title", subTitle: "subTitle subTitle 블라블라", image: "rib")
    }
}
