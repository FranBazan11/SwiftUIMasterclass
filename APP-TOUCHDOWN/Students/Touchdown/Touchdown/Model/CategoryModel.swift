//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Juan Bazan Bazan Carrizo on 13/12/2022.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
