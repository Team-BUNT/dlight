//
//  DancerProfileView.swift
//  dlight
//
//  Created by Jung Yunseong on 2022/11/17.
//

import SwiftUI

struct DancerProfileView: View {
    @StateObject var classViewModel = ClassViewModel()
    var video: Video
    
    let tags = ["가벼운", "세련된", "절제된"]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 8) {
                information()
                    .padding(.bottom, 20)
                
                Text("클래스 목록")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color("Primary"))
                    .tracking(-0.41)
                classList()
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: Templates
    func information() -> some View {
        HStack(alignment: .bottom, spacing: 11) {
            // Image
            Image(video.dancerName)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 12) {
                // Name & Genre
                HStack(alignment: .bottom, spacing: 2) {
                    Text(video.dancerName)
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
                    ForEach(video.tag, id: \.self) { tag in
                        Tag(tagString: tag)
                    }
                }
            }
        }
    }
    
    func classList() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                ForEach(classViewModel.classList, id: \.self) { item in
                    Button(action: {
                        Safari.open(target: item.studioName)
                    }, label: {
                        ClassRow(classImage: item.classImage,
                                 className: item.className,
                                 studioName: item.studioName.name,
                                 studioAddress: item.studioAddress,
                                 classTime: item.classTime
                        )
                    })
                }
            }
        }
    }
}


// MARK: - Components
struct Tag: View {
    var tagString: String = "Tag Label"
    
    var body: some View {
        Text(tagString)
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

struct ClassRow: View {
    var classImage: String = "Dancer"
    var className: String = "Class Name"
    var studioName: String = "Studio Name"
    var studioAddress: String = "Studio Address"
    var classTime: String = "class Time"
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Class Image
            Image(classImage)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 7))
            
            // Class informations
            VStack(alignment: .leading) {
                Text(className)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.white)
//                    .padding(.bottom, 2)

                
                Text(studioName)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color("Text-Secondary"))
                    
                Text(studioAddress)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color("Text-Secondary"))
                    
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                // Class Time
                Text(classTime)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color("Text-Secondary"))
                    .tracking(-0.24)
                
                // Indicators
                Image(systemName: "chevron.right")
                    .font(.system(size: 15))
                    .foregroundColor(Color("Indicators"))
            }
        }
    }
}

//struct DancerProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        DancerProfileView(dancerName: "Nema")
//        ClassRow()
//            .previewLayout(.sizeThatFits)
//    }
//}
