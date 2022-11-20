//
//  ContentView.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/18.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        
        DanceRecommendView()
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboradingFirst(isPresented: $isFirstLaunching)
            }
        
//        VideoView(video:  Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Dora", ofType: "mp4")!)), replay: false, bpm: 112, startTime: 6.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
