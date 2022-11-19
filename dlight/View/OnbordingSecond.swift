//
//  OnbordingSecond.swift
//  dlight
//
//  Created by leejunmo on 2022/11/17.
//

import SwiftUI

struct OnbordingSecond: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var isPresented: Bool
    
    @State var selectedNum: Int = 0
    let styleData: [[String]] = [
        ["가벼운", "무거운", "화려한"],
        ["깔끔한", "파워풀한", "절제된"],
        ["우아한", "터프한", "유머러스한"],
        ["부드러운", "시원시원한", "섹시한"],
        ["트렌디한", "역동적인", "올드스쿨"],
        ["서정적인", "유연한"]
    ]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack(spacing: 0) {
                Text("아래 키워드에서\n원하는 스타일을 골라주세요")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.top, 60)
                    .padding(.bottom, 8)
                Text("최대 다섯 개까지 가능해요")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color("Text-Secondary"))
                    .padding(.bottom, 32)
                
                ForEach(styleData, id: \.self) { list in
                    HStack(spacing: 0) {
                        ForEach(list, id: \.self) { data in
                            CapsuleView(selectedNum: $selectedNum, title: data)
                                .padding(.horizontal, 9)
                        }
                    }.padding(.bottom, 16)
                }
                
                Button(action: {
                    // 여기에 시트변수 토글
                    isPresented = false
                    dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color("Primary"))
                            .frame(maxHeight: 50)
                        Text("다 골랐어요!")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                })
                .padding(.top, 48)
                .padding(.bottom, 8)
                Button(action: {
                    dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color("Background"))
                            .frame(maxHeight: 50)
                        Text("이전으로")
                            .font(.system(size: 17, weight: .semibold))
                            .underline()
                            .foregroundColor(.white)
                    }
                })
                .padding(.bottom, 17)
            }
            .padding(.horizontal, 24)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CapsuleView: View {
    @State var isSelected: Bool = false
    @Binding var selectedNum: Int
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(isSelected ? .white : Color("Background"))
            .font(.system(size: 17, weight: .semibold))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                .fill(isSelected ? Color("Primary") : .white)
            )
            .onTapGesture {
                withAnimation() {
                    if isSelected {
                        selectedNum -= 1
                        isSelected.toggle()
                    } else {
                        if selectedNum < 5 {
                            selectedNum += 1
                            isSelected.toggle()
                        }
                    }
                }
            }
    }
}

struct OnbordingSecond_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingSecond(isPresented: .constant(true))
    }
}
