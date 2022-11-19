//
//  Video.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import Foundation
import AVKit

struct Video : Identifiable {
    
    var id : Int
    var player : AVPlayer
    var replay : Bool = true
    var bpm : Int

}

struct DanceVideo: Codable {
    var ID: String
    var tag: [String]
    var dancerName: String
    var dancerID: String
}
