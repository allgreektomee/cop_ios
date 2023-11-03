//
//  WineDetailView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct WineDetailView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @Binding var showTabBar: Bool
    @State var wineLiked: Bool
    var wineID: Int
    
    var body: some View {
        VStack {
            NaviView(leftButton: ["back_arrow", "back_home"],title: "상세",rightButton: "search")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: homeViewModel.wineDetail?.photos[0].file ?? "")) { image in
                        image
                            .resizable()
                            .cornerRadius(12)
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width - 48 ,height: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    HStack(spacing: 2) {
                        Image("star_full")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Image("star_full")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Image("star_full")
                            .resizable()
                            .frame(width: 12, height: 12)
                    }
                    .padding(.top, 10)
                    .padding(.leading, 6)
                    
                    Text(homeViewModel.wineDetail?.name ?? "")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
//                        .padding(.top)
                    
                    Text(homeViewModel.wineDetail?.nameEn ?? "")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                        .padding(.bottom, 40)
                    
                    Text("\(Int(homeViewModel.wineDetail?.alcohol ?? 0)) ℃ \(homeViewModel.wineDetail?.type ?? "") • \(homeViewModel.wineDetail?.country.name ?? "") • \(homeViewModel.wineDetail?.region.name ?? "") • \(homeViewModel.wineDetail?.grapes.name ?? "")")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                    
                    Text("\(homeViewModel.wineDetail?.price ?? 0)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                    
                    Text("바디 \(Int(homeViewModel.wineDetail?.tasteBody ?? 0)) /5 • 당도 \(homeViewModel.wineDetail?.tasteSugar ?? 0) /5 • 산미 \(homeViewModel.wineDetail?.tasteAcidity ?? 0) /5 • 탄닌 \(homeViewModel.wineDetail?.tasteTannin ?? 0) /5")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                }
            }
            .onAppear {
                homeViewModel.getWineDatail(pk: wineID)
            }
            
            // bottom View
            HStack(spacing: 30) {
                HStack {
                    Button {
                        // 좋아요
                        homeViewModel.postLikeWine(type: "LIKE", id: wineID, username: Common.shared.loginID ?? "")
                            .sink { completion in
                                print(completion)
                            } receiveValue: { response in
                                if response {
//                                    self.tag = 1
                                    self.wineLiked.toggle()
                                }
                            }.store(in: &homeViewModel.cancellables)

                        
                    } label: {
                        Image(wineLiked ? "heart_full" : "heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .frame(alignment: .leading)
                    }

                    
                    NavigationLink {
                        ReviewView(reviewID: wineID, type: "wine")
                            .onAppear {
                                showTabBar  = false
                            }
                    } label: {
                        Image("message")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .frame(alignment: .leading)
                    }
                }
                
                Button {
                    homeViewModel.postLikeWine(type: "ORDER", id: wineID, username: Common.shared.loginID ?? "")
                        .sink { completion in
                            print(completion)
                        } receiveValue: { response in
                            if response {
//                                    self.tag = 1
//                                self.wineLiked.toggle()
                            }
                        }.store(in: &homeViewModel.cancellables)
                    
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .overlay {
                            Text("주문하기")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.gray800)
                        }
                        .foregroundColor(.mainYellow)
                        .frame(width: 206, height: 60, alignment: .trailing)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(Color.gray800.ignoresSafeArea(edges: .bottom))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .frame(alignment: .bottom)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .background(Color.gray800)
    }
    
    
}

func descriptionLabel(content: String, size: Double, weight: Font.Weight) -> Text? {
    return Text(content)
        .font(.system(size: size, weight: weight))
        .foregroundColor(Color.white)
        .multilineTextAlignment(.leading)
        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
        .padding(.leading, 6)
        .padding(.top) as? Text
}

//struct WineDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WineDetailView(wineLiked: true, wineID: 1)
//    }
//}

