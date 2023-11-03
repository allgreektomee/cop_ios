//
//  ClassView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import SwiftUI

struct ClassView: View {
    @Binding var showTabBar: Bool
    @StateObject var classViewModel = ClassViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    ListSlideTitle(title: "올그릭투미", subTitle: "좋아할만한 와인을 추천드릴게요!", image: "rib")
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(.leading, 48)
                        .padding(.top, 80)
                        .onAppear {
                            showTabBar = true
                        }
                    
                    ScrollView([.horizontal], showsIndicators: false) {
                        ForEach(classViewModel.noticeList, id: \.self) { notice in
                            AsyncImage(url: URL(string: notice.photos[0].file)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width - 30, height: 300)
                            } placeholder: {
                                ProgressView()
                            }
                            
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .background(Color.gray600)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 300)
                    .cornerRadius(20, corners: .allCorners)
                    
                    ListSlideTitle(title: "올그릭투미", subTitle: "좋아할만한 와인을 추천드릴게요!", image: "rib")
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(.leading, 48)
                        .padding(.top, 60)
                    
                    
                    
                    VStack {
                        ForEach(classViewModel.classList, id: \.self) { wineClass in
                            ClassListCell(showTabBar: $showTabBar, wineClass: wineClass)
                                .padding(.bottom, 10)
                        }
                    }
                    .padding(.bottom, 120)
                    
                }
            }
            
            .ignoresSafeArea()
            .background(Color.gray800)
            .onAppear {
                classViewModel.getClassList()
                classViewModel.getNotice(type: 3)
            }
        }
    }
}

struct ClassHome_Previews: PreviewProvider {
    
    static var previews: some View {
        ClassView(showTabBar: .constant(false))
    }
}
