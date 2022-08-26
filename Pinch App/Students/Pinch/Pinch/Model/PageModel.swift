//
//  PageModel.swift
//  Pinch
//
//  Created by Juan Francisco Bazan Carrizo on 25/08/2022.
//

import Foundation

struct PageModel: Identifiable {
    let id: Int
    let imageName: String
}

extension PageModel {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
