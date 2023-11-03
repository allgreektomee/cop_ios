//
//  ReviewView.swift
//  agtm
//
//  Created by yujin on 2023/06/28.
//

import SwiftUI

struct ReviewView: View {
    @StateObject var likeViewModel = LikeViewModel()
    @State var text: String = ""
    var reviewID: Int = 1
    var type: String?
    
    var body: some View {
        VStack {
            NaviView(leftButton: ["back_arrow", "back_home"],title: "상세",rightButton: "search")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(likeViewModel.reviewList, id: \.self) { review in
                        ReviewCell(review: review)
                        
                        Divider()
                    }
                }
            }
            
            //TextView
            HStack {
                AsyncImage(url: URL(string: Common.shared.loginInfo?.img ?? "")) { image in
                    image
                        .resizable()
                        .cornerRadius(5)
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                
                TextField("", text: $text)
                    .frame(width: UIScreen.main.bounds.width - 150, height: 40)
                    .background(Color.white)
                    .cornerRadius(10, corners: .allCorners)
                
                Button {
                    // 댓글 등록
                    likeViewModel.postReview(content: ReviewData(pk: reviewID,
                                                                 comment: text,
                                                                 rating: 5),
                                             type: self.type ?? "",
                                             id: reviewID,
                                             username: Common.shared.loginID ?? "")
                    .sink { completion in
                        print(completion)
                    } receiveValue: { response in
                        if response {
                            if self.type == "wine" {
                                likeViewModel.getWineReview(id: reviewID)
                            } else {
                                likeViewModel.getClassReview(id: reviewID)
                            }
                        }
                    }
                    .store(in: &likeViewModel.cancellables)
                } label: {
                    Text("등록")
                        .font(.system(size: 12, weight: .medium))
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.gray800.ignoresSafeArea(edges: .bottom))
            .frame(alignment: .bottom)
        }
        .onAppear {
            likeViewModel.getWineReview(id: reviewID)
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.gray800)
    }
}

//struct ReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewView()
//    }
//}
