//
//  DancerRecommendViewModel.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/18.
//

import Foundation
import AVKit

class DanceRecommendViewModel: ObservableObject {
    
    
    @Published var index = 0
    @Published var top = 0
    @Published var isShowStyleView = false {
        didSet {
            if isShowStyleView == false {
                
            }
        }
    }
    
    @Published var data = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Nema", ofType: "mp4")!)), replay: false, bpm: 153, startTime: 7.2),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Dora", ofType: "mp4")!)), replay: false, bpm: 109, startTime: 7.2),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Groot", ofType: "mp4")!)), replay: false, bpm: 106, startTime: 7.2),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Sun-J", ofType: "mp4")!)), replay: false, bpm: 98, startTime: 7.2),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Yellow-D", ofType: "mp4")!)), replay: false, bpm: 129, startTime: 7.2),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "BrotherBin", ofType: "mp4")!)), replay: false, bpm: 106, startTime: 7.2),
        Video(id: 6, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Chocobi", ofType: "mp4")!)), replay: false, bpm: 96, startTime: 7.2),
    ]
}
