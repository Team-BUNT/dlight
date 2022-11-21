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
    var studioName: StudioName
    var studioAddress: String
    var classTime: String
}

class ClassViewModel: ObservableObject {
    @Published var classList = [
        ClassData(classImage: "bunt", className: "정규 코레오", studioName: .bunt, studioAddress: "서울특별시 구로구 XXX XXX", classTime: "11. 17. 20:00"),
        ClassData(classImage: "bonafide", className: "Pop-up", studioName: .bonafide, studioAddress: "서울특별시 용산구 XXX XXX", classTime: "11. 17. 20:00"),
        ClassData(classImage: "newflare", className: "정규 베이직", studioName: .newFlare, studioAddress: "서울특별시 강남구 XXX XXX", classTime: "11. 17. 20:00")
    ]
}


