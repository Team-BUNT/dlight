//
//  WebView.swift
//  dlight
//
//  Created by leejunmo on 2022/11/17.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else { return WKWebView() }
        
        let webView = WKWebView()
        webView.backgroundColor = .black
        
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}

enum StudioName: String {
    case bonafide
    case bunt
    case movidic
    case newFlare
    
    var url: String {
        switch self {
        case .bonafide:
            return "https://www.bunt.life/form/studios/bonafide/login"
        case .bunt:
            return "https://www.bunt.life/form/studios/bunt/login"
        case .movidic:
            return "https://www.bunt.life/form/studios/movidic/login"
        case .newFlare:
            return "https://www.bunt.life/form/studios/newflare/login"
        }
    }
}
