//
//  FormView.swift
//  dlight
//
//  Created by leejunmo on 2022/11/17.
//

import SwiftUI

struct FormView: View {
    @Environment(\.presentationMode) var presentationMode
    let studioName: StudioName
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("닫기")
                    })
                    Spacer()
                }
                WebView(urlToLoad: studioName.url)
            }
            .padding(.horizontal)
        }
    }
}
