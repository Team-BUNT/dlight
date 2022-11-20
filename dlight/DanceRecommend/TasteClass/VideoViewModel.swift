//
//  VideoViewModel.swift
//  MYD
//
//  Created by GOngTAE on 2022/05/05.
//

import Foundation
import AVKit
import Combine

final class PlayerViewModel: ObservableObject {
    let player = AVPlayer()
    @Published var isPlaying = false
    
    @Published var isEditingCurrentTime = false
    @Published var currentTime: Double = .zero
    @Published var duration: Double?
    @Published var playTime: Double = .zero
    @Published var isHide: Bool = false
    @Published var rhythmCount: Int = 1
    
    private var subscriptions: Set<AnyCancellable> = []
    private var timeObserver: Any?
    
    deinit {
        if let timeObserver = timeObserver {
            player.removeTimeObserver(timeObserver)
        }
    }
    
    var timeObserverToken: Any?
    
    init() {
        
        $playTime
            .sink { [weak self] time in
                guard let self = self else { return }
                self.player.seek(to: CMTime(seconds: time, preferredTimescale: 1), toleranceBefore: .zero, toleranceAfter: .zero)
                if self.player.rate != 0 {
                    self.player.play()
                    self.isHide = false
                }
            }
            .store(in: &subscriptions)
        
        //파일 경로 탐색
        
        $isEditingCurrentTime
            .dropFirst()
            .filter({ $0 == false })
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                self.player.seek(to: CMTime(seconds: self.currentTime, preferredTimescale: 1), toleranceBefore: .zero, toleranceAfter: .zero)
                if self.player.rate != 0 {
                    self.player.play()
                }
            })
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
        
        timeObserver = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: 600), queue: .main) { [weak self] time in
            guard let self = self else { return }
//            if self.isEditingCurrentTime == false {
//                self.currentTime = time.seconds
//            }
            
            print("hey now is \(time.seconds)")
            if time.seconds > 10 {
                self.isHide = false
                self.playTime = 7.2
                
            }
            
            if time.seconds > 9 {
                self.isHide = true
            }
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
    
    
//    func addBoundaryTimeObserver() {
//
//        // Divide the asset's duration into quarters.
//        let interval = CMTimeMultiplyByFloat64(player.currentItem?.asset.duration, 0.0.1)
//        var currentTime = CMTime.zero
//        var times = [NSValue]()
//
//        // Calculate boundary times
//        while currentTime < asset.duration {
//            currentTime = currentTime + interval
//            times.append(NSValue(time:currentTime))
//        }
//
//        timeObserverToken = player.addBoundaryTimeObserver(forTimes: times,
//                                                           queue: .main) {
//            // Update UI
//
//            if times.last ==
//        }
//    }
}
