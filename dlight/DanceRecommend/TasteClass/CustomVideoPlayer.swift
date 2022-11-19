//
//  CustomVideoPlayer.swift
//  MYD
//
//  Created by GOngTAE on 2022/05/05.
//

import Foundation
import SwiftUI
import AVKit
import Combine

struct CustomVideoPlayer: UIViewRepresentable {
    
    @ObservedObject var playerVM: PlayerViewModel

    func makeUIView(context: Context) -> SimplePlayerView {
        let view = SimplePlayerView()
        view.player = playerVM.player
        return view
    }
    
    func updateUIView(_ uiView: SimplePlayerView, context: Context) { }
}


class SimplePlayerView: UIView {

    // Override the property to make AVPlayerLayer the view's backing layer.
    override static var layerClass: AnyClass { AVPlayerLayer.self }

    // The associated player object.
    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }

   var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
}




