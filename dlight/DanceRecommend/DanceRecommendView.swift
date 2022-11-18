//
//  DanceRecommendView.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import SwiftUI
import AVKit

struct DanceRecommendView: View {
    
    @State var index = 0
    @State var top = 0
    @State var isShowStyleView = false {
        didSet {
            if isShowStyleView == false {
                
            }
        }
    }
    
    @State var data: [Video] = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 6, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                PlayerScrollView(data: self.$data, index: self.$index)
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            //스타일 시트
                            isShowStyleView.toggle()
                        } label: {
                            Text("스타일 다시 정하기")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .shadow(radius: 10)
                        }
                        .padding(.trailing)
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    HStack {
                        
                        Image("Dancer")
                            .resizable()
                            .frame(width: 50)
                            .cornerRadius(25)
                        
                        Text("루크")
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                        NavigationLink {
                            DancerProfileView(index: $index)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.red)
                                
                                Text("자세히 알아보기")
                                    .font(.system(size: 17))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        .frame(width: 155)
                        
                        
                    }
                    .frame(height: 50)
                    .padding(20)
                    .padding(.bottom, 30)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                self.data.shuffle()
            }
        }
        .fullScreenCover(isPresented: $isShowStyleView) {
            OnbordingSecond(isPresented: $isShowStyleView)
        }
    }
}

struct DanceRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        DanceRecommendView()
    }
}
