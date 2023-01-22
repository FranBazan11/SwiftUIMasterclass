//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 15/01/2023.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPRETIES
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        if let shopSafe = shop.selectedProduct {
            VStack(alignment: .leading, spacing: 0) {
                // NAV BAR
                NavigationBarDetailView()
                    .padding(.horizontal)
                
                // HEADER
                HeaderDetailView(productName: shopSafe.name)
                    .padding(.horizontal)
                
                // DETAIL TOP PART
                TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
                
                // DETAIL BOTTOM PART
                VStack(alignment: .center, spacing: 10) {
                    // RATING + SIZES
                    RatingsSizesDetailView()
                    // DESCRIPTION
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(shopSafe.description)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    // QUANTITY + FOVOURITE
                    QuantityFavouriteDetailView()
                    
                    // ADD TO CART
                    AddToCartDetailView()
                } //: VStack
                .padding(.horizontal)
                .background(
                    Color.white
                        .clipShape(CustomShape())
                        .padding(.top, -105)
                        .ignoresSafeArea()
                )
            } //: VStack
            .zIndex(0)
            .background(
                Color(red: shopSafe.red,
                      green: shopSafe.green,
                      blue: shopSafe.blue)
                    .ignoresSafeArea()
            )
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
    }
}
