//
//  ProfileViewModel.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import SwiftUI
import Combine

import Moya

class ProfileViewModel : ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    @Published var profile: Profile?
    @Published var wineReviewList: ReviewList?
    @Published var classReviewList: ReviewList?
    
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    func getUserInfo(username: String) {
        provider.requestPublisher(.getUserInfo(name: username))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(Profile.self) else { return }
                self.profile = responseData
                Common.shared.loginInfo = responseData
            }.store(in : &cancellables)
    }

    func getWineReviewList(username: String) {
        provider.requestPublisher(.getUserReview(name: username, type: "wine"))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ReviewList.self) else { return }
                self.wineReviewList = responseData
            }.store(in : &cancellables)
    }
    
    func getClassReviewList(username: String) {
        provider.requestPublisher(.getUserReview(name: username, type: "class"))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ReviewList.self) else { return }
                self.classReviewList = responseData
            }.store(in : &cancellables)
    }
}
