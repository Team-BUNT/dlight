//
//  Video.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import Foundation
import AVKit

struct Video : Identifiable {
    
    var id : String
    var player : AVPlayer?
    var replay : Bool = true
    
    init(model: DanceVideo) {
        self.id = model.ID
        
        let manager = FireStorageService()
//        manager.requestVideoURL(videoID: model.ID) { url in
//            self.player = AVPlayer(url: url)
//        }
    }
}

struct DanceVideo: Codable {
    var ID: String
    var tag: [String]
    var dancerName: String
    var dancerID: String
}
