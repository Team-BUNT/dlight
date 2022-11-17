//
//  WebView.swift
//  dlight
//
//  Created by leejunmo on 2022/11/17.
//

import SwiftUI
import WebKit

struct Safari {
    static func open(target: StudioName) {
        if let url = URL(string: target.url) {
            UIApplication.shared.open(url)
        }
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
