//
//  ClassModel.swift
//  dlight
//
//  Created by Jung Yunseong on 2022/11/18.
//

import Foundation

struct ClassData: Hashable {
    var classImage: String
    var className: String
    var studioName: String
    var studioAddress: String
    var classTime: String
}

class ClassViewModel: ObservableObject {
    @Published var classList = [
        ClassData(classImage: "Dancer", className: "루크의 뚝딱 클래스", studioName: "뉴플레어 스튜디오", studioAddress: "서울특별시 구로구 XXX XXX", classTime: "11. 17. 20:00"),
        ClassData(classImage: "Dancer", className: "똑딱 클래스", studioName: "보나파이드 스튜디오", studioAddress: "서울특별시 용산구 XXX XXX", classTime: "11. 17. 20:00"),
        ClassData(classImage: "Dancer", className: "루크의 뚝딱", studioName: "힉스 스튜디오", studioAddress: "서울특별시 강남구 XXX XXX", classTime: "11. 17. 20:00")
    ]
}


