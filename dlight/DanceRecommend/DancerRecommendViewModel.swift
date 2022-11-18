//
//  DancerRecommendViewModel.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/18.
//

import Foundation
import AVKit

class DanceRecommendViewModel: ObservableObject {
    
    @Published var data = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 6, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
    ]
}
