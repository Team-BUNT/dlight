//
//  AnalysisView.swift
//  dlight
//
//  Created by Jung Yunseong on 2022/11/18.
//

import SwiftUI
import RiveRuntime

struct AnalysisView: View {
    var body: some View {
        VStack {
            Text("당신의 댄스 스타일을\n찾는 중입니다")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color.white)
                .tracking(-0.41)
                .multilineTextAlignment(.center)
            
            RiveViewModel(fileName: "Loading").view()
                .frame(height: UIScreen.main.bounds.width)
        }
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
