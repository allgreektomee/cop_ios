//
//  ClassViewModel.swift
//  agtm
//
//  Created by yujin on 2023/10/11.
//

import SwiftUI
import Combine

import Moya

class ClassViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    @Published var classList: ClassList = []
    @Published var noticeList: NoticeList = []
    @Published var classDetail: ClassDetail?
    
    func getClassList() {
        provider.requestPublisher(.getWineClass(user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ClassList.self) else { return }
                self.classList = responseData
            }.store(in : &cancellables)
    }
    
    func getClassDetail(pk: Int) {
        provider.requestPublisher(.getWineClassDetail(page: pk, user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ClassDetail.self) else { return }
                self.classDetail = responseData
            }.store(in : &cancellables)
    }
    
    func getNotice(type: Int) {
        provider.requestPublisher(.getNotice(type: type))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(NoticeList.self) else { return }
                self.noticeList = responseData
            }.store(in : &cancellables)
    }
    
    func postLikeClass(type: String,id: Int, username: String) -> AnyPublisher<Bool, Error> {
        provider.requestPublisher(.postLikeClass(LikeData(type: type), pk: id, name: username))
            .tryMap { response in
                return true
            }
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
}
