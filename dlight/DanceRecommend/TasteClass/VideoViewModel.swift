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
    
    @Published var isEditingCurrentTime = false
    
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
    
    init(video: Video) {
        
        self.player = video.player
        self.barTime = 60 / video.bpm
        self.startTime = video.startTime
        self.endTime = startTime + barTime * 4
        player.currentItem?.audioTimePitchAlgorithm = .timeDomain
        
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
        
        //파일 경로 탐색
        
//        $isEditingCurrentTime
//            .dropFirst()
//            .filter({ $0 == false })
//            .sink(receiveValue: { [weak self] _ in
//                guard let self = self else { return }
//                self.player.seek(to: CMTime(seconds: self.currentTime, preferredTimescale: 1), toleranceBefore: .zero, toleranceAfter: .zero)
//                if self.player.rate != 0 {
//                    self.player.rate = self.currentRate
//                    self.player.play()
//                }
//            })
//            .store(in: &subscriptions)
        
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
            if time.seconds > self.endTime + self.barTime {
                if self.isHide {
                    self.isHide = false
                    print("show video")
                }
                self.playTime = self.startTime - self.barTime
                self.player.rate = self.currentRate
            }
            
            // 가림막 Logic
            if time.seconds > self.startTime + (self.barTime * Double(self.rhythmCount))
                && time.seconds < self.endTime {
                if self.isHide == false {
                    self.isHide = true
                    print("hide video")
                }
            }
            
            withAnimation(.spring()) {
                self.currentCount = 1 + ((time.seconds - self.startTime + self.barTime) / self.barTime )
            }
            
        }
    }
    
    func playFromStart() {
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
