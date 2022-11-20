//
//  VideoViewModel.swift
//  MYD
//
//  Created by GOngTAE on 2022/05/05.
//

import SwiftUI
import AVKit
import Combine

final class PlayerViewModel: ObservableObject {
    let player: AVPlayer
    @Published var isPlaying = false
    
    @Published var duration: Double?
    @Published var playTime: Double = .zero
    @Published var isHide: Bool = false
    @Published var hideEnable: Bool = true
    
    @Published var rhythmCount: Int = 1
    @Published var currentTime: Double = .zero
    @Published var currentCount: Double = 1
    @Published var currentRate: Float = 1.0
    
    private var startTime: Double
    private var barTime: Double
    private var endTime: Double
    
    private var subscriptions: Set<AnyCancellable> = []
    private var timeObserver: Any?
    
    deinit {
        if let timeObserver = timeObserver {
            player.removeTimeObserver(timeObserver)
        }
    }
    
    var timeObserverToken: Any?
    
    var data = [
        Video(id: 0, dancerName: "Nema", tag: ["무거운", "유머러스한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Nema", ofType: "mp4")!)), replay: false, bpm: 153, startTime: 7.2),
        Video(id: 1, dancerName: "Dora", tag: ["화려한", "시원시원한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Dora", ofType: "mp4")!)), replay: false, bpm: 112, startTime: 6.1),
        Video(id: 2, dancerName: "Groot", tag: ["가벼운", "유머러스한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Groot", ofType: "mp4")!)), replay: false, bpm: 106, startTime: 2.7),
        Video(id: 3, dancerName: "Sun-J", tag: ["섹시한", "유연한", "트렌디한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Sun-J", ofType: "mp4")!)), replay: false, bpm: 98, startTime: 0.7),
        Video(id: 4, dancerName: "Yellow-D", tag: ["역동적인", "트렌디한", "시원시원한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Yellow-D", ofType: "mp4")!)), replay: false, bpm: 129, startTime: 5.1),
        Video(id: 5, dancerName: "BrotherBin", tag: ["가벼운", "유머러스한", "올드스쿨"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "BrotherBin", ofType: "mp4")!)), replay: false, bpm: 96, startTime: 6.2),
        Video(id: 6, dancerName: "Chocobi", tag: ["화려한", "터프한", "역동적인"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Chocobi", ofType: "mp4")!)), replay: false, bpm: 96, startTime: 3.7)
        ]
    
    init(video: Video) {
        
        self.player = data[video.id].player
        self.barTime = 60 / video.bpm
        self.startTime = video.startTime
        self.endTime = startTime + barTime * 4
//        player.currentItem?.audioTimePitchAlgorithm = .timeDomain
        
        $currentRate
            .sink { rate in
                self.player.rate = rate
            }
            .store(in: &subscriptions)
        
        
        $playTime
            .sink { [weak self] time in
                guard let self = self else { return }
                self.player.seek(to: CMTime(seconds: time, preferredTimescale: 1), toleranceBefore: .zero, toleranceAfter: .zero)
                if self.player.rate != 0 {
                    self.player.rate = self.currentRate
                    self.player.play()
                    self.isHide = false
                }
            }
            .store(in: &subscriptions)
        
        //NSObject 를 사용한 publisher init -> 해당 Key 값에 해당하는 변수를 관찰하는 퍼블리셔 생성
        player.publisher(for: \.timeControlStatus) //
            .sink { [weak self] status in
                switch status {
                case .playing:
                    self?.isPlaying = true
                case .paused:
                    self?.isPlaying = false
                case .waitingToPlayAtSpecifiedRate:
                    break
                @unknown default:
                    break
                }
            }
            .store(in: &subscriptions)
        
        timeObserver = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.2, preferredTimescale: 600), queue: .main) { [weak self] time in
            guard let self = self else { return }
//            if self.isEditingCurrentTime == false {
//                self.currentTime = time.seconds
//            }
            
            print("hey now is \(time.seconds)")
            
            // 구간반복 Logic
            if time.seconds > self.startTime + self.barTime * Double(self.rhythmCount) {
                if self.isHide {
                    self.isHide = false
                    print("show video")
                }
                self.playTime = self.startTime - self.barTime * 2
                self.player.rate = self.currentRate
            }
            
            withAnimation(.spring()) {
                self.currentCount = 1 + ((time.seconds - self.startTime + self.barTime) / self.barTime )
            }
            
        }
    }
    
    func playFromStart() {
        self.isHide = false
        self.playTime = self.startTime - self.barTime
        self.player.rate = self.currentRate
    }
    
    func changePlayRate() {
        if currentRate == 1.0 {
            currentRate = 0.5
        } else if currentRate == 0.5 {
            currentRate = 0.25
        } else {
            currentRate = 1.0
        }
    }
    
    func setCurrentItem(_ item: AVPlayerItem) {
        currentTime = .zero
        duration = nil
        player.replaceCurrentItem(with: item)
        
        item.publisher(for: \.status)
            .filter({ $0 == .readyToPlay })
            .sink(receiveValue: { [weak self] _ in
                self?.duration = item.asset.duration.seconds
            })
            .store(in: &subscriptions)
    }
    
    
}
