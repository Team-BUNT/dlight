//
//  ContentView.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/18.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        
//        DanceRecommendView()
//            .fullScreenCover(isPresented: $isFirstLaunching) {
//                OnboradingFirst(isPresented: $isFirstLaunching)
//            }
        
        VideoView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
