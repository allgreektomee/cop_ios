//
//  NetworkManger.swift
//  agtm
//
//  Created by yujin on 2023/10/06.
//

import Combine
import Moya

class NetworkManger: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    @Published var wines: wineList = []
    @Published var wineClass: ClassList = []
    @Published var wineDetail: WineDetail?
    
    var totalPage: Int = 3
    var page: Int = 0
    
    func getNextWines() {
        if page <= totalPage {
            page += 1
            getWineList(page: page)
        }
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
}
