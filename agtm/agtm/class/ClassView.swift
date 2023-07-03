//
//  ClassView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import SwiftUI

struct ClassView: View {
    var body: some View {
        VStack {
            ClassSlideMenu()
                .padding(.horizontal, 10)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Button {
                        //
                    } label: {
                        VStack(alignment: .leading) {
                           RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.gray)
                                .frame(height: 300)
                                .padding(.leading, 15)
                                .padding(.trailing, 15)
                                .padding(.bottom, 10)
                            
                            Text("올그릭스토리")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.purple)
                                .padding(.leading, 20)
                            
                            Text("송파본점 조지아 와인 특별 시음회")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                                .padding(.bottom, 1)
                            
                            Text("#조지아 #시음회 #독점수입")
                                .font(.system(size: 14, weight: .thin))
                                .foregroundColor(.purple)
                                .padding(.leading, 20)
                        }
                    }
                    .padding(.bottom, 30)

                    ClassListView()
//                    ClassMenuGrid()
                    TabbarBank()
                }
            }
        
        }
       
    }
}

struct ClassHome_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
    }
}
