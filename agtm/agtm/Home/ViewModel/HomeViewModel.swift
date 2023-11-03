//
//  HomeViewModel.swift
//  agtm
//
//  Created by yujin on 2023/10/10.
//

import SwiftUI
import Combine

import Moya

class HomeViewModel : ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    @Published var wines: wineList = []
    @Published var winesTypeList: wineList = []
    @Published var pickWines: wineList = []
    @Published var monthlyWines: wineList = []
    @Published var wineClass: ClassList = []
    @Published var notices: NoticeList = []
    @Published var wineDetail: WineDetail?
    
    var totalPage: Int = 3
    var page: Int = 0
    
    func getNextWines() {
        if page <= totalPage {
            page += 1
            getWineList(page: page)
        }
    }
    
    func getNotice() {
        provider.requestPublisher(.getNoticeList)
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(NoticeList.self) else { return }
                self.notices = responseData
            }.store(in : &cancellables)
    }
    
    func getWineList(page: Int) {
        provider.requestPublisher(.getWineList(page: page, user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(wineList.self) else { return }
                self.wines.append(contentsOf: responseData)
            }.store(in : &cancellables)
    }
    
    func getWineTypeList(type: String) {
        provider.requestPublisher(.getWineType(type: type, user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(wineList.self) else { return }
                self.winesTypeList = responseData
            }.store(in : &cancellables)
    }
    
    func getWineDatail(pk: Int) {
        provider.requestPublisher(.getWineDetail(id: pk, user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(WineDetail.self) else { return }
                self.wineDetail = responseData
            }.store(in : &cancellables)
    }
    
    func getWineClass() {
        provider.requestPublisher(.getWineClass(user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(ClassList.self) else { return }
                self.wineClass = responseData
            }.store(in : &cancellables)
    }
    
    func getPickWines() {
        provider.requestPublisher(.getWineRecommand(filter: "pick", user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(wineList.self) else { return }
                self.pickWines = responseData
            }.store(in : &cancellables)
    }
    
    func getMonthlyWines() {
        provider.requestPublisher(.getWineRecommand(filter: "month", user: Common.shared.loginID ?? ""))
            .sink { completion in
                print(completion)
            } receiveValue: { recievedValue in
                guard let responseData = try? recievedValue.map(wineList.self) else { return }
                self.monthlyWines = responseData
            }.store(in : &cancellables)
    }
    
    func postLikeWine(type: String,id: Int, username: String) -> AnyPublisher<Bool, Error> {
        provider.requestPublisher(.postLikeWine(LikeData(type: type), pk: id, name: username))
            .tryMap { response in
                return true
            }
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
}
