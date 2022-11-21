//
//  PlayerView.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import SwiftUI

struct PlayerView : View {
    
    @Binding var data : [Video]
    @Binding var index: Int
    
    var body: some View{
        
        VStack(spacing: 0){
            
            ForEach(0..<self.data.count){ i in
                
                ZStack{
                    
                    Player(player: self.data[i].player)
                        // full screensize because were going to make paging...
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -5)
                    
                    if self.data[i].replay {
                        
                        Button(action: {
                            
                            self.data[i].replay = false
                            self.data[i].player.seek(to: .zero)
                            self.data[i].player.play()
                            
                        }) {
                            
                            Image(systemName: "goforward")
                                .resizable()
                                .frame(width: 55, height: 60)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.data[self.index].player.play()
            self.data[self.index].player.actionAtItemEnd = .none

            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[self.index].player.currentItem, queue: .main) { (_) in
                self.data[self.index].replay = true
            }
        }
    }
}
