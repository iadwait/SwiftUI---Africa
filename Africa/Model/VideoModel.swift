//
//  VideoModel.swift
//  Africa
//
//  Created by Adwait Barkale on 06/11/24.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    
    let id: String
    let name: String
    let headline: String

    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
