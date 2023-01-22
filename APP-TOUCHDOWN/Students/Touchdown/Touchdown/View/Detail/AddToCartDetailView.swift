//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 19/01/2023.
//

import SwiftUI

struct AddToCartDetailView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        if let product = shop.selectedProduct {
            Button {
                feedback.impactOccurred()
            } label: {
                Spacer()
                Text("Add to card".uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            } //: BUTTON
            .padding(15)
            .background(
                Color(red: product.red,
                      green: product.green,
                      blue: product.blue)
            )
        .clipShape(Capsule())
        }
    }
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
    }
}
