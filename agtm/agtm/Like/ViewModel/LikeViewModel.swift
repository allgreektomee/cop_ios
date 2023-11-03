//
//  LikeViewModel.swift
//  agtm
//
//  Created by yujin on 2023/10/12.
//

import SwiftUI
import Combine

import Moya

class LikeViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    @Published var likeWineList: WineLikeList = []
    @Published var likeClassList: ClassLikeList = []
    
    @Published var reviewList: ReviewList = []
    
    // wish wine
    func getLikeWineList() {
        provider.requestPublisher(.getLikeWineList(name: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(WineLikeList.self) else { return }
                self.likeWineList = responseData
            }.store(in : &cancellables)
    }
    
    // order wine
    func getOrderWineList() {
        provider.requestPublisher(.getOrderWineList(name: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(WineLikeList.self) else { return }
                self.likeWineList = responseData
            }.store(in : &cancellables)
    }
    
    
    // wish class
    func getLikeClassList() {
        provider.requestPublisher(.getLikeClassList(name: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ClassLikeList.self) else { return }
                self.likeClassList = responseData
            }.store(in : &cancellables)
    }
    
    //order class
    func getOrderClassList() {
        provider.requestPublisher(.getOrderClassList(name: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ClassLikeList.self) else { return }
                self.likeClassList = responseData
            }.store(in : &cancellables)
    }
    
    //get class review
    func getClassReview(id: Int) {
        provider.requestPublisher(.getClassReview(id: id, name: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ReviewList.self) else { return }
                self.reviewList = responseData
            }.store(in : &cancellables)
    }
    
    //get wine review
    func getWineReview(id: Int) {
        provider.requestPublisher(.getWineReview(id: id, name: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ReviewList.self) else { return }
                self.reviewList = responseData
            }.store(in : &cancellables)
    }
    
    func postReview(content: ReviewData, type: String, id: Int, username: String) -> AnyPublisher<Bool, Error> {
        provider.requestPublisher(.postReview(content, type: type, id: id, name: username))
            .tryMap { response in
                return true
            }
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
}
