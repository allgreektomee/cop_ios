//
//  WebView.swift
//  agtm
//
//  Created by 20201385 on 2023/06/14.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: String
 
    func makeUIView(context:Context) ->WKWebView {
        
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        webView.load(URLRequest(url:url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url:"test")
    }
}
