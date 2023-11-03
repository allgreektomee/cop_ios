//
//  KakaoLoginView.swift
//  agtm
//
//  Created by yujin on 2023/07/21.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


struct KakaoLoginView: View {
    var body: some View {
        VStack {
            // 카카오 로그인
            Button {
                if (UserApi.isKakaoTalkLoginAvailable()) { // 카카오톡이 설치되어 있는지 확인
                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in // 카카오톡으로 로그인
                        print(oauthToken)
                        print(error)
                    }
                } else {
                    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in // 카카오 계정으로 로그인
                        print(oauthToken)
                        print(error)
                    }
                }
            } label : {
                Text("kakao login")
                //                    Image("kakao_login_large_wide")
                //                        .resizable()
                //                        .aspectRatio(contentMode: .fit)
                //                        .frame(width : UIScreen.main.bounds.width * 0.9)
            }
        }
    }
}

struct KakaoLoginVIew_Previews: PreviewProvider {
    static var previews: some View {
        KakaoLoginView()
    }
}
