//
//  CardModel.swift
//  LearnByDoing
//
//  Created by Juan Bazan Carrizo on 27/09/2023.
//

import SwiftUI

struct CardModel: Identifiable {
    var id = UUID()
    let title: String
    let headline: String
    let imageName: String
    let callToAction: String
    let message: String
    let gradientColors: [Color]
}
