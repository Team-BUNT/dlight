//
//  PlayerScrollView.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import SwiftUI
import AVKit

struct PlayerScrollView : UIViewRepresentable {
    
    @Binding var data : [Video]
    @Binding var index: Int
    
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        // each children occupies one full screen so height = count * height of screen...
        
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        // same here...
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        // to ignore safe area...
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // to dynamically update height based on data...
        
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        for i in 0..<uiView.subviews.count{
            
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : PlayerScrollView
        var index = 0
        
        init(parent1 : PlayerScrollView) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let currenrindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currenrindex{
                
                index = currenrindex
                
                for i in 0..<parent.data.count{
                    
                    // pausing all other videos...
                    parent.data[i].player.seek(to: .zero)
                    parent.data[i].player.pause()
                }
                
                // playing next video...
                
                parent.index = index
                parent.data[index].player.play()
                parent.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { (_) in
                    
                    // notification to identify at the end of the video...
                    
                    // enabling replay button....
                    self.parent.data[self.index].replay = true
                }
            }
        }
    }
}
