//
//  DanceRecommendView.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import SwiftUI
import AVKit

struct DanceRecommendView: View {
    
    @StateObject var vm = DanceRecommendViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                PlayerScrollView(data: $vm.data, index: $vm.index)
                    .onDisappear {
                        vm.data[vm.index].player.pause()
                    }
                
                //MARK: - Gradient Background
                VStack {
                    
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: 0.8),
                            endPoint: UnitPoint(x: 0.5, y: -3.0e-2)))
                        .frame(height: 150)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.8)))
                        .frame(height: 300)
                }
                
                VStack {
                    //MARK: - Top
                    HStack {
                        
                        NavigationLink {
                            VideoView(video: vm.data[vm.index])
                        } label: {
                            Text("배워보기")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .shadow(radius: 10)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        Button {
                            vm.isShowStyleView.toggle()
                        } label: {
                            Text("스타일 다시 정하기")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .shadow(radius: 10)
                        }
                        .padding(.trailing)
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    //MARK: - Bottom
                    HStack {
                        ForEach(vm.data[vm.index].tag, id: \.self) { tag in
                            hashtagCapsuleView(tag: tag)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        
                        Image("\(vm.data[vm.index].dancerName)")
                            .resizable()
                            .frame(width: 50)
                            .cornerRadius(25)
                        
                        Text("\(vm.data[vm.index].dancerName)")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        NavigationLink {
                            DancerProfileView(video: vm.data[vm.index])
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color("Primary"))
                                
                                Text("자세히 알아보기")
                                    .font(.system(size: 17))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        .frame(width: 155)
                    }
                    .frame(height: 50)
                    .padding(20)
                    .padding(.bottom, 30)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
//                vm.data.shuffle()
            }
        }
        .fullScreenCover(isPresented: $vm.isShowStyleView) {
            OnbordingSecond(isPresented: $vm.isShowStyleView)
        }
        .edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark) // white tint on status bar
        
    }
    
    //MARK: - Helper
    private func hashtagCapsuleView(tag: String) -> some View {
        Text("#\(tag)")
            .foregroundColor(Color("Primary"))
            .font(.system(size: 17, weight: .semibold))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(.white)
            )
    }
}

struct DanceRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        DanceRecommendView()
    }
}
