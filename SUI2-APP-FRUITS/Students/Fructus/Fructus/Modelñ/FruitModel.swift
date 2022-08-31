//
//  FruitModel.swift
//  Fructus
//
//  Created by Juan Francisco Bazan Carrizo on 29/08/2022.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL
struct Fruit: Identifiable {
    var id =  UUID()
    var title: String
    var headline: String
    var image: String
    var gradient: [Color]
    var description: String
    var nutritions: [String]
}
