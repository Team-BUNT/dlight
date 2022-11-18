//
//  NewbieView.swift
//  dlight
//
//  Created by jiin on 2022/11/18.
//


enum MusicGenre: String, CaseIterable, Equatable {
    case Boombap
    case RnB
    case Trap
    case KPOP
    case POP
    case Rock
    case Funk
    case Indy
    case EDM
    case Jazz



    var koreanText: String {
        switch self {
        case .Trap:
            return "트랩"
        case .Boombap:
            return "붐뱁"
        case .Rock:
            return "락"
        case .Indy:
            return "인디"
        case .RnB:
            return "R&B"
        case .Jazz:
            return "재즈"
        default:
            return self.rawValue
        }
    }
}

import SwiftUI

struct NewbieView: View {
    
    @Binding var isFirstLaunching: Bool

    let choice = ["음악을 듣고 가볍게 리듬을 타고 싶어서", "친구들과 영상을 찍기위해", "멋진 무대에서 공연해보고 싶어서"]

    @State var selectedItems: [String] = []
    // 선택한 선택지를 담는 어레이 구현 필요 [ ]
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Q.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("왜 춤을 배워보고 싶으신가요?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 80)

                VStack {
                    ForEach(0..<3) { index in
                        PreferenceButtonView(isFirstLaunching: $isFirstLaunching, text: choice[index], items: $selectedItems)
                    }
                }
                Spacer()
           NavigationLink {
               MusicPreferenceView(isFirstLaunching: $isFirstLaunching)
                } label: {
                    Text("다음") //idk why
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .buttonStyle(PreferenceButtonStyle())

            }
            .padding(.horizontal, 20)
            .navigationBarHidden(true)
            .background(Color("Background"))
        }
        .navigationBarBackButtonHidden(true)
    }
}


//버튼 애니메이션
struct PreferenceButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Color("Primary") : Color(.white))
            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewbieView()
//            .preferredColorScheme(.dark)
//    }
//}
