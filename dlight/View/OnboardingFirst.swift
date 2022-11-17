//
//  OnboradingFirst.swift
//  dlight
//
//  Created by leejunmo on 2022/11/17.
//

import SwiftUI

struct OnboradingFirst: View {
    @State var test: Bool = false
    @Binding var var familiar: Bool
    
    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            VStack(spacing: 0) {
                Text("당신은 춤에")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 150)
                
                Spacer()
                
                Button(action: {
                    familiar = false
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .frame(maxHeight: 50)
                        Text("어색해요")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(Color("bg"))
                    }
                })
                .padding(.bottom, 17)
                Button(action: {
                    familiar = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .frame(maxHeight: 50)
                        Text("익숙해요")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(Color("bg"))
                    }
                })
                .padding(.bottom, 17)
            }
            .padding(.horizontal, 24)
        }
    }
}


