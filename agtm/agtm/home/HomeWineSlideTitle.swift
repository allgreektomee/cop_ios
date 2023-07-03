//
//  HomeWineSlideTitle.swift
//  agtm
//
//  Created by 20201385 on 2023/06/07.
//

import SwiftUI

struct HomeWineSlideTitle: View {
    var title : String
    var subTitle : String
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            Text(subTitle)
                .font(.system(size: 16, weight: .light))
                       
        }
    }
}

struct HomeWineSlideTitle_Previews: PreviewProvider {
    static var previews: some View {
        HomeWineSlideTitle(title: "Title Title", subTitle: "subTitle subTitle 블라블라")
    }
}
