//
//  ProfileView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @Binding var showTabBar: Bool
    @State var isShowAlert: Bool = false
    
    var body: some View {
            VStack {
                ProfileCell(title: "프로필 정보", cellHeight: 120)
                    .overlay {
                        HStack(spacing: 10) {
                            AsyncImage(url: URL(string: profileViewModel.profile?.img ?? "")) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.top, 3)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            
                            Text(profileViewModel.profile?.username ?? "")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            
//                            Image("arrow")
//                                .padding(.top, 3)
//                                .padding(.leading, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    }
                    .padding(.bottom, 20)
                    .onAppear {
                        showTabBar = true
                    }
                
                ProfileCell(title: "내가 작성한 리뷰", cellHeight: 130)
                    .overlay {
                        VStack(spacing: 3) {
                            NavigationLink {
                                WineReviewListView(showTabBar: $showTabBar,
                                                   reviewList: profileViewModel.wineReviewList ?? [])
                            } label: {
                                HStack(spacing: 130) {
                                    Text("와인 리뷰 목록")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width * 0.35 , alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                    
                                    Image("arrow")
                                        .padding(.top, 3)
                                        .padding(.leading, 20)
                                }
                            }

                            NavigationLink {
                                WineReviewListView(showTabBar: $showTabBar,
                                                   reviewList: profileViewModel.classReviewList ?? [])
                            } label: {
                                HStack(spacing: 130) {
                                    Text("클래스 리뷰 목록")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width * 0.35, alignment: .leading)
                                    
                                    Image("arrow")
                                        .padding(.top, 3)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                
//                ProfileCell(title: "내가 작성한 리뷰", cellHeight: 120)
//                    .foregroundColor(Color.gray600)
//                    .frame(width: UIScreen.main.bounds.width - 40, height: 120)
//                    .overlay {
//                        VStack {
//                            Text("...")
//                                .font(.system(size: 20, weight: .medium))
//                                .foregroundColor(.white)
//                        }
//                    }
                
                ProfileCell(title: "기타", cellHeight: 130)
                    .overlay {
                        VStack(spacing: 3) {
                            HStack(spacing: 130) {
                                Text("로그아웃")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width * 0.35, alignment: .leading)
                                
                                Image("arrow")
                                    .padding(.top, 3)
                                    .padding(.leading, 20)
                            }
                            
                            Button {
                                isShowAlert.toggle()
                            } label: {
                                HStack(spacing: 130) {
                                    Text("문의")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                        .frame(width: UIScreen.main.bounds.width * 0.35, alignment: .leading)
                                    
                                    Image("arrow")
                                        .padding(.top, 3)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .padding(.top, 10)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(alignment: .top)
            .onAppear {
                profileViewModel.getUserInfo(username: Common.shared.loginID ?? "")
                profileViewModel.getWineReviewList(username: Common.shared.loginID ?? "")
                profileViewModel.getClassReviewList(username: Common.shared.loginID ?? "")
            }
            .background(Color.gray800)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showTabBar: .constant(true))
    }
}
