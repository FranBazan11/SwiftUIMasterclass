//
//  AnimalModel.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 06/10/2022.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
