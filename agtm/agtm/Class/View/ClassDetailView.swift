//
//  ClassDetailView.swift
//  agtm
//
//  Created by yujin on 2023/10/16.
//

import SwiftUI

struct ClassDetailView: View {
    @StateObject var classViewModel = ClassViewModel()
    @Binding var showTabBar: Bool
    @State var classLiked: Bool
    var classID: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    AsyncImage(url: URL(string: classViewModel.classDetail?.photos[0].file ?? "")) { image in
                        image
                            .resizable()
                            .cornerRadius(12)
                            .frame(width: UIScreen.main.bounds.width - 48 ,height: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(classViewModel.classDetail?.title ?? "")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                    
                    Text(classViewModel.classDetail?.subtitle ?? "")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                        .padding(.bottom, 40)
                    
                    Text(classViewModel.classDetail?.description ?? "")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 48, alignment: .leading)
                        .padding(.leading, 6)
                }
            }
            .onAppear {
                classViewModel.getClassDetail(pk: classID)
            }
            
            // bottom View
            HStack(spacing: 30) {
                HStack {
                    Button {
                        // 좋아요
                        classViewModel.postLikeClass(type: "Like", id: classID, username: Common.shared.loginID ?? "")
                            .sink { completion in
                                print(completion)
                            } receiveValue: { response in
                                if response {
//                                    self.tag = 1
                                    self.classLiked.toggle()
                                }
                            }.store(in: &classViewModel.cancellables)

                        
                    } label: {
                        Image(classLiked ? "heart_full" : "heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .frame(alignment: .leading)
                    }

                    
                    NavigationLink {
                        ReviewView(reviewID: classID, type: "class")
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
                    classViewModel.postLikeClass(type: "ORDER", id: classID, username: Common.shared.loginID ?? "")
                        .sink { completion in
                            print(completion)
                        } receiveValue: { response in
                            if response {
//                                    self.tag = 1
//                                self.classLiked.toggle()
                            }
                        }.store(in: &classViewModel.cancellables)
                    
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("back_arrow")
                .imageScale(.large)
        })
        .background(Color.gray800)
    }
}

//struct ClassDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassDetailView()
//    }
//}
