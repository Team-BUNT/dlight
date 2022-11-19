//
//  VideoView.swift
//  MYD
//
//  Created by GOngTAE on 2022/05/02.
//

import SwiftUI
import AVKit
import UIKit

/*
 1. AVPlayer 세팅 [✅]
 2. AVPlayerLayer -> UIView [✅]
 3. SwiftUI 에 UIView 표시하기 [✅]
 4. UIKit <-> SwiftUI 서로 데이터 신호 주고 받는 거 공부하기 [✅]
 https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
 5. Combine 을 이용한 비디오 신호 비동기 커뮤니케이션 [✅]
 https://www.createwithswift.com/custom-video-player-with-avkit-and-swiftui-supporting-picture-in-picture/
 */


struct VideoView: View {
    @StateObject private var viewModel = PlayerViewModel()
    
    @State var like: Float = 0
    
    var body: some View {
        ZStack {
            
            
            CustomVideoPlayer(playerVM: viewModel)
                .scaledToFill()
                .ignoresSafeArea()
                .onAppear {
                    guard let path = Bundle.main.path(forResource: "Nema", ofType:"mp4") else {
                                debugPrint("popping_0.mp4 not found")
                        return }
                    //로컬 url
                    let url = URL(fileURLWithPath: path)
                    
                    viewModel.setCurrentItem(AVPlayerItem(url: url))
                    viewModel.player.play()
                    
                }
                .onDisappear {
                    viewModel.player.pause()
                }
//
//            CustomControlsView(playerVM: viewModel)
//                .frame(width: 300, height: 100)

            
            VStack {
                
                Spacer()
                
                
                ZStack {
                    
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                        .frame(height: 300)
                    
                    
                    HStack(spacing: 0) {
                        
                        ForEach(1..<5) { index in
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 32, height: 3)
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60)
                                .overlay( Text("\(index)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                )
                                .onTapGesture {
                                    seekTo(index: index)
                                }
                        }
                    }
                }
                .frame(height: 100)
                .padding(.bottom, 20)
            }
            .padding(.vertical)
        }
        .navigationBarHidden(true)
    }
    
    func seekTo(index: Int) {
        print("Lets go to \(index)")
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
