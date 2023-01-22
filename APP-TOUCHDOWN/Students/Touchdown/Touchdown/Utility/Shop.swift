//
//  Shop.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 20/01/2023.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: ProductModel? = nil
}
