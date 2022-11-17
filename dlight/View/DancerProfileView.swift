//
//  DancerProfileView.swift
//  dlight
//
//  Created by Jung Yunseong on 2022/11/17.
//

import SwiftUI

struct DancerProfileView: View {
    let tags = ["가벼운", "세련된", "절제된"]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 28) {
                information()
                
                Text("클래스 목록")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color("Primary"))
                    .tracking(-0.41)
                classList()
            }
        }
    }
    
    // MARK: Templates
    func information() -> some View {
        HStack(alignment: .bottom, spacing: 11) {
            // Image
            Image("Dancer")
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 12) {
                // Name & Genre
                HStack(alignment: .bottom, spacing: 2) {
                    Text("Name")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(Color.white)
                        .tracking(-0.41)
                    
                    Text("Genre")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("Text-Secondary"))
                        .tracking(-0.41)
                }
                
                // Tags
                HStack(spacing: 8) {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background {
                                Capsule()
                                    .fill(Color("Primary"))
                            }
                    }
                }
            }
        }
    }
    
    func classList() -> some View {
        ScrollView(showsIndicators: false) {
            Text("")
        }
    }
}

struct ClassRow: View {
    var body: some View {
        HStack {
            Image("Dancer")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 7))
        }
    }
}

struct DancerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DancerProfileView()
        ClassRow()
            .previewLayout(.sizeThatFits)
    }
}
