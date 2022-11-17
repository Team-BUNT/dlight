//
//  MusicPreferenceView.swift
//  dlight
//
//  Created by jiin on 2022/11/17.
//

import SwiftUI

enum MusicGenre : CaseIterable {
    case KPOP, BOOMBAP, EDM, JAZZ
}

struct MusicPreferenceView: View {
    //간격 한번에 설정하기 위한 변수
    var totalSpacing: CGFloat = 20
    
    @State var selectedItems: [MusicGenre] = []
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: totalSpacing),
                        GridItem(.flexible())
                    ], spacing: totalSpacing
                    ) {
                        ForEach(MusicGenre.allCases, id: \.self) { item in
                            MusicButtonView(item: item, items: $selectedItems)
                        }
                    }
                    .padding(.horizontal, totalSpacing)
                    .padding(.top, 20)
                }
                .background(Color("Background"))
                
                VStack {
                    NavigationLink {
                        //VideoView() 여기서 스타일을 찾는 중입니다 뷰 가면 될듯
                    } label: {
                        Text("다음")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PreferenceButtonStyle())
                    .padding(.horizontal, 20)
                }
                .frame(height: 80)
            }
            
//            VStack {
//                Spacer()
//            }
        }
        .background(Color("Background"))
        .navigationTitle(
            Text("음악 취향")
        )
    }
}





struct MusicPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicPreferenceView()
                .preferredColorScheme(.dark)
        }
    }
}
