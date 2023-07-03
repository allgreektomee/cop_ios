//
//  WineDetailView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct WineDetailView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                Image("testMenu")
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: 380,height: 500)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("윌리엄 셀럼 러시안 리버 밸리 ")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.gray)
                        Text("AGTM AGTM AGTM")
                            .font(.system(size: 15, weight: .medium))
                            .fontWeight(.medium)
                            .foregroundColor(.gray)

                    }
                    .padding(.leading, 30)
                    Spacer()
                    Image("testMenu")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                        .padding(.trailing, 30)

                }.padding(.top, 10)
                
                Text("title title")
                    .font(.title)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                    .bold()
                
                Text("body")
                    .font(.title)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                
                Text("info infoinfoinfoinfo")
                    .font(.title)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                
                
                Text("ㅇㄹㄴ 4/5")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                Text("ㅇㄹㄴ 4/5")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                Text("ㅇㄹㄴ 4/5")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                Text("ㅇㄹㄴ 4/5")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350,height: 30, alignment: .leading)
                
            }
            
            TabbarBank()
        }
    }
}

struct WineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WineDetailView()
    }
}
