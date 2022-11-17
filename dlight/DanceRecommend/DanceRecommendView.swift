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
    @State var data: [Video] = [
        Video(id: "0", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: "1", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: "2", player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
    ]

    var body: some View {
        ZStack {
            
            PlayerScrollView(data: self.$data)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.red)
                        
                        Text("자세히 알아보기")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 155, height: 50)
                    .padding(20)
                    .padding(.bottom, 30)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DanceRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        DanceRecommendView()
    }
}
