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
    @State var data: [Video] = []

    var body: some View {
        ZStack {
            
            PlayerScrollView(data: self.$data)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Capsule()
                }
            }
        }
    }
}

struct DanceRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        DanceRecommendView()
    }
}
