//
//  MusicButtonView.swift
//  dlight
//
//  Created by jiin on 2022/11/17.
//


import SwiftUI

struct MusicButtonView: View {
    
    let item: MusicGenre
    
    @Binding var items: [MusicGenre]
    
    
    var body: some View {
        
        Button {
            //ViewModel 로 이사가야할 로직 🚧
            if items.contains(item) {
                
                items.removeAll { $0 == item }
            } else {
                if items.count < 3 {
                    items.append(item)
                }
            }
            print(items)
        } label: {
            ZStack {
                Image(item.rawValue)
                    .resizable()
                    .clipShape(
                        DiagonalFrame()
                    )
                
                VStack {
                    HStack {
                        Text(item.koreanText)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(20)
    
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .aspectRatio(16 / 14, contentMode: .fit)
        .background(Color("Indicators"))
        .cornerRadius(10)
        .if(items.contains(item)) { view in
            view.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1.5)
                    .fill(Color("AccentColor"))
            )
        }
    }
}


struct MusicButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MusicButtonView(item: .BOOMBAP, items: .constant([]))
            .frame(width: 180, height: 160)
            .previewLayout(.sizeThatFits)
            
    }
}
