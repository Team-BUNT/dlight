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
            //MARK: - Video
            CustomVideoPlayer(playerVM: viewModel)
                .ignoresSafeArea(edges: .vertical)
                .scaledToFill()
                .onAppear {
                    viewModel.player.play()
                }
                .onDisappear {
                    viewModel.player.pause()
                }
            
            //MARK: - View
            VStack {
                
                //MARK: - Top
                
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(
                                gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1)]),
                                startPoint: UnitPoint(x: 0.5, y: 0.8),
                                endPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-2)))
                    .frame(height: 150)
                    
                    Button {
                        viewModel.changePlayRate()
                    } label: {
                        Text(String(format: "%.1f", viewModel.currentRate) + "x")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 10)
                    }
                    .padding(.top, 30)
                }
                
                Spacer()
                
                //MARK: - Bottom
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
                                        .foregroundColor(.black)
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
            .ignoresSafeArea(edges: .vertical)
            .padding(.bottom)
        }
        .preferredColorScheme(.dark)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video:  Video(id: 0, dancerName: "Nema", tag: ["화려한"], player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Nema", ofType: "mp4")!)), replay: false, bpm: 153, startTime: 7.2) )
    }
}
