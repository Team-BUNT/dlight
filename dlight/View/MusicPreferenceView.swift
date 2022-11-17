//
//  MusicPreferenceView.swift
//  dlight
//
//  Created by jiin on 2022/11/18.
//


import SwiftUI

struct MusicPreferenceView: View {
    //간격 한번에 설정하기 위한 변수
    var totalSpacing: CGFloat = 20
    
    @State var selectedItems: [MusicGenre] = []
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("음악 취향")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                    Text("최대 세 개까지 가능해요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 12))
                }
                .padding(.leading, 20)
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
                        AnalysisView()
                    } label: {
                        Text("다음") //idk why
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PreferenceButtonStyle())
                    .padding(.horizontal, 20)
                
                }
                .frame(height: 80)
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color("Background"))
//        .navigationTitle(
//            Text("음악 취향")
//        )
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
