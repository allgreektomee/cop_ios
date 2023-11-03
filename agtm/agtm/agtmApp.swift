//
//  agtmApp.swift
//  agtm
//
//  Created by 20201385 on 2023/06/05.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main // 시작
struct agtmApp: App {
    
//    init() {
//        KakaoSDK.initSDK(appKey: "[네이티브 앱 키]")
//    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
//            SignUpView()
//            ContentView()
//                .onOpenURL { url in
//                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                        _ = AuthController.handleOpenUrl(url: url)
//                    }
//                }
        }
    }
}
