//
//  OnboradingFirst.swift
//  dlight
//
//  Created by leejunmo on 2022/11/17.
//

import SwiftUI

struct OnboradingFirst: View {
    
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("지금 배우고 싶은\n댄스 스타일이 있나요?")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 150)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        OnbordingSecond( isFirstLaunching: $isFirstLaunching)
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.white)
                                .frame(maxHeight: 50)
                            Text("네 있어요!")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(Color("Background"))
                        }
                    })
                    .padding(.bottom, 17)
                    
                    NavigationLink(destination: {
                        NewbieView(isFirstLaunching: $isFirstLaunching)
                        //EmptyView()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.white)
                                .frame(maxHeight: 50)
                            Text("아뇨 잘 모르겠어요")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(Color("Background"))
                        }
                    })
                    .padding(.bottom, 17)
                }
                .padding(.horizontal, 24)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct OnboradingFirst_Previews: PreviewProvider {
    static var previews: some View {
        OnboradingFirst(isFirstLaunching: .constant(true))
    }
}
