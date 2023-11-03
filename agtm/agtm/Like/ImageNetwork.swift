//
//  ImageNetwork.swift
//  agtm
//
//  Created by yujin on 2023/07/14.
//

import SwiftUI
import Combine
import Moya
import CombineMoya

class ImageNetwork: ObservableObject {
    var imageID: String = ""
    @Published var image: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    func getImageURL() {
//        URLSession
//        URLSession.shared
//            .dataTaskPublisher(for: URL(string: "https://api.cloudflare.com")!)
//            .map(\.data)
//            .decode(type: ImageURL.self, decoder: JSONDecoder())
//            .sink { completion in
//                if case .failure(let err) = completion {
//                    print("Retrieving data failed with error \(err)")
//                }
//            } receiveValue: { object in
//                print("Retrieved object \(object)")
//            }
//            .store(in : &cancellables)
    
//
//        provider.requestPublisher(.getImageURL)
//            .sink { completion in
//                print(completion)
//            } receiveValue: { recievedValue in
//                guard let responseData = try? recievedValue.map(ImageURL.self) else { return }
//                self.imageID =  responseData.result.id
//            }.store(in : &cancellables)
//    }
//
//    func postImage(data: Data) {
//        provider.requestPublisher(.postImage(id: imageID, parma: data))
//            .sink { completion in
//                print(completion)
//            } receiveValue: { recievedValue in
//                guard let responseData = try? recievedValue.map(ImageUpload.self) else { return }
//                self.image = responseData.result.variants[0]
//            }.store(in : &cancellables)
    }
}
