//
//  FireStorageService.swift
//  dlight
//
//  Created by GOngTAE on 2022/11/17.
//

import Foundation
import FirebaseStorage

class FireStorageService {

    let storageRef = Storage.storage().reference()
    
    func requestVideoURL(videoID: String, completion: @escaping (URL) -> Void) {
        
        let videoRef = storageRef.child("danceVideo/\(videoID)")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        videoRef.downloadURL { url, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                completion(url!)
            }
        }
    }
}

