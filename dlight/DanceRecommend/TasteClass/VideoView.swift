//
//  VideoView.swift
//  MYD
//
//  Created by GOngTAE on 2022/05/02.
//

import SwiftUI
import AVKit
import UIKit

struct VideoView: View {
    
    @StateObject var viewModel: PlayerViewModel
    var video: Video
    
    init(video: Video) {
        self.video = video
        _viewModel = StateObject(wrappedValue: PlayerViewModel(video: video))
    }
    
    var body: some View {
        ZStack {
            
            CustomVideoPlayer(playerVM: viewModel)
                .scaledToFill()
                .ignoresSafeArea(edges: .vertical)
                .onAppear {
                    viewModel.player.play()
                }
                .onDisappear {
                    viewModel.player.pause()
                }
            
            
            if viewModel.isHide {
                ZStack {
                    Rectangle()
                        .opacity(0.95)
                    .ignoresSafeArea()
                    
                    Text("\(Int(viewModel.currentCount) - 2)")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                }
            }
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.changePlayRate()
                    } label: {
                        Text(String(format: "%.1f", viewModel.currentRate) + "x")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 10)
                    }
                }
                .frame(width: 360, height: 100)
                
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
                    
                    
                    ZStack {
                        
                        ProgressView(value: viewModel.currentCount, total: 5)
                            .frame(height: 60)
                            .padding(.trailing, 230)
                        
                        
                        HStack(spacing: 30) {
                            
                            ForEach(1..<5) { index in
                                
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        
                                    if index <= viewModel.rhythmCount {
                                        Circle()
                                            .stroke(lineWidth: 4)
                                            .foregroundColor(Color("Primary"))
                                    }
                                    
                                    
                                    Text("\(index)")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                }
                                .onTapGesture {
                                    viewModel.rhythmCount = index
                                    viewModel.isHide = false
                                    viewModel.playFromStart()
                                }
                            }
                        }
                    }
                    .frame(height: 60)
                }
                .frame(height: 100)
                .padding(.bottom, 20)
            }
            .padding(.vertical)
        }
        .navigationBarHidden(true)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video:  Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Nema", ofType: "mp4")!)), replay: false, bpm: 153, startTime: 7.2) )
    }
}
