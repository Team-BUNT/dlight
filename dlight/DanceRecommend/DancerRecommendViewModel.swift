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
        Video(id: 0, dancerName: "Nema", tag: ["무거운", "유머러스한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Nema", ofType: "mp4")!)), replay: false, bpm: 153, startTime: 7.2),
        Video(id: 1, dancerName: "Dora", tag: ["세련된", "부드러운", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Dora", ofType: "mp4")!)), replay: false, bpm: 112, startTime: 6.1),
        Video(id: 2, dancerName: "Groot", tag: ["가벼운", "유머러스한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Groot", ofType: "mp4")!)), replay: false, bpm: 106, startTime: 2.7),
        Video(id: 3, dancerName: "Sun-J", tag: ["섹시한", "화려한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Sun-J", ofType: "mp4")!)), replay: false, bpm: 98, startTime: 0.7),
        Video(id: 4, dancerName: "Yellow-D", tag: ["세련된", "절제된", "부드러운"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Yellow-D", ofType: "mp4")!)), replay: false, bpm: 116, startTime: 2.8),
        Video(id: 5, dancerName: "BrotherBin", tag: ["가벼운", "유머러스한", "올드스쿨"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "BrotherBin", ofType: "mp4")!)), replay: false, bpm: 130, startTime: 1.7),
        Video(id: 6, dancerName: "Chocobi", tag: ["화려한", "터프한", "역동적인"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Chocobi", ofType: "mp4")!)), replay: false, bpm: 96, startTime: 3.7)
    ]
}
