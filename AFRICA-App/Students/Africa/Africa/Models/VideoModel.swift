//
//  VideoModel.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 14/10/2022.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
